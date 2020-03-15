//
//  XSpaceResultViewController.swift
//  TheXSpace
//
//  Created by King Khan on 3/14/20.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit
import Apollo

class XSpaceResultViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var rocketLabel: UILabel!
    @IBOutlet weak var videoLinkLabel: UILabel!
    var selectedData:[GraphQLSelectionSet?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Up UI
        self.settingUI()
    }
    
    func settingUI(){
        if selectedData.count >= 1{
            dateLabel.text = selectedData[0]?.resultMap["launch_date_local"] as? String ?? "No Launch Date"
            missionLabel.text = selectedData[0]?.resultMap["mission_name"] as? String ?? "No Mission Name"
            rocketLabel.text = (selectedData[0]?.resultMap["rocket"] as? [String: Any?])?["rocket_name"] as? String ?? "No Rocket Name"
            videoLinkLabel.text = (selectedData[0]?.resultMap["links"] as? [String: Any?])?["video_link"] as? String ?? "No Link"
        }
    }
}
