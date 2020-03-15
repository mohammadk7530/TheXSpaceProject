//
//  XSpaceSearchViewController.swift
//  TheXSpace
//
//  Created by King Khan on 3/8/20.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit
import Apollo

class XSpaceSearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var launchesData = [GraphQLSelectionSet?]()
    var filteredData:[GraphQLSelectionSet?] = [] 
    var filteredName:[String] = []
    var watcher: GraphQLQueryWatcher<LoadingLaunchesQuery>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Navigation Bar
        self.navigationItem.title = "The XSpace"
        let leftBarButton = UIBarButtonItem(title: "Exit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.exitApp))
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        
        self.loadData()
        // Search Bar Delegate methods.
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        
        //setting message Label text and showing on UI
        messageLabel.text = "Please search by Mission Name, Rocket Name or Launch Year."
        messageLabel.isHidden = false
        
        
    }
    
    //To Terminate the App
    @objc func exitApp() {
        exit(-1)
    }
    
    
    // MARK: - Load Data from server
    
    func loadData() {
        
        
        watcher = apollo.watch(query: LoadingLaunchesQuery(), resultHandler: { result in
            switch result {
            case .success(let newResult):
                guard let new = newResult.data?.launchesPast else {return}
                for newValues in new{
                    self.launchesData.append(newValues)
                }
                guard let new2 = newResult.data?.launchesUpcoming else {return}
                
                for newValues in new2 {
                    self.launchesData.append(newValues)
                }
            case .failure(let error):
                print("Error loading contacts: \(error.localizedDescription)")
            }
        })
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        if searchText.count >= 2{
            filteredData = launchesData.filter{(item:GraphQLSelectionSet?) -> Bool in
                
                return ((item?.resultMap["launch_year"] as? String)?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil) ||
                    ((item?.resultMap["mission_name"] as? String)?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil) ||
                    ((((item?.resultMap["rocket"]) as? [String: Any?])?["rocket_name"] as? String)?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil)
            }
            messageLabel.isHidden = true
            self.setValuesForCell(searchText: searchText)
            
        } else {
            messageLabel.text = "Please search by Mission Name, Rocket Name or Launch Year."
            messageLabel.isHidden = false
            filteredData = []
            filteredName = []
        }
        tableView.reloadData()
    }
    
    //Setting value to show on taleView cell
    func setValuesForCell(searchText: String){
        for item in filteredData {
            if let title = item?.resultMap["launch_year"] as? String, title.prefix(2) == searchText  {
                self.filteredName.append(item?.resultMap["launch_year"] as? String ?? "")
            }
            else if let title = item?.resultMap["mission_name"] as? String, title.prefix(2) == searchText {
                filteredName.append(item?.resultMap["mission_name"] as? String ?? "")
                
            } else if let title = (((item?.resultMap["rocket"]) as? [String: Any?])?["rocket_name"] as? String), title.prefix(2) == searchText {
                filteredName.append((((item?.resultMap["rocket"]) as? [String: Any?])?["rocket_name"] as? String) ?? "")
            }
        }
    }
}


// MARK: - Table View

extension XSpaceSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as? XSpaceSearchTableViewCell else{return UITableViewCell()}
        cell.nameLbl.text = filteredName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        DispatchQueue.main.async {
            guard let vc = UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "XSpaceResultViewController") as? XSpaceResultViewController else{return}
            vc.selectedData = [self.filteredData[indexPath.row]]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

