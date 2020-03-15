// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LoadingLaunchesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query loadingLaunches {
      launchesPast {
        __typename
        ...launches
      }
      launchesUpcoming {
        __typename
        ...launches
      }
    }
    """

  public let operationName: String = "loadingLaunches"

  public var queryDocument: String { return operationDefinition.appending(Launches.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("launchesPast", type: .list(.object(LaunchesPast.selections))),
      GraphQLField("launchesUpcoming", type: .list(.object(LaunchesUpcoming.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launchesPast: [LaunchesPast?]? = nil, launchesUpcoming: [LaunchesUpcoming?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launchesPast": launchesPast.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, "launchesUpcoming": launchesUpcoming.flatMap { (value: [LaunchesUpcoming?]) -> [ResultMap?] in value.map { (value: LaunchesUpcoming?) -> ResultMap? in value.flatMap { (value: LaunchesUpcoming) -> ResultMap in value.resultMap } } }])
    }

    public var launchesPast: [LaunchesPast?]? {
      get {
        return (resultMap["launchesPast"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesPast?] in value.map { (value: ResultMap?) -> LaunchesPast? in value.flatMap { (value: ResultMap) -> LaunchesPast in LaunchesPast(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, forKey: "launchesPast")
      }
    }

    public var launchesUpcoming: [LaunchesUpcoming?]? {
      get {
        return (resultMap["launchesUpcoming"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesUpcoming?] in value.map { (value: ResultMap?) -> LaunchesUpcoming? in value.flatMap { (value: ResultMap) -> LaunchesUpcoming in LaunchesUpcoming(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesUpcoming?]) -> [ResultMap?] in value.map { (value: LaunchesUpcoming?) -> ResultMap? in value.flatMap { (value: LaunchesUpcoming) -> ResultMap in value.resultMap } } }, forKey: "launchesUpcoming")
      }
    }

    public struct LaunchesPast: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(Launches.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var launches: Launches {
          get {
            return Launches(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct LaunchesUpcoming: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(Launches.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var launches: Launches {
          get {
            return Launches(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct Launches: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment launches on Launch {
      __typename
      mission_name
      launch_year
      launch_date_local
      rocket {
        __typename
        rocket_name
      }
      links {
        __typename
        video_link
      }
    }
    """

  public static let possibleTypes: [String] = ["Launch"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("mission_name", type: .scalar(String.self)),
    GraphQLField("launch_year", type: .scalar(String.self)),
    GraphQLField("launch_date_local", type: .scalar(String.self)),
    GraphQLField("rocket", type: .object(Rocket.selections)),
    GraphQLField("links", type: .object(Link.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(missionName: String? = nil, launchYear: String? = nil, launchDateLocal: String? = nil, rocket: Rocket? = nil, links: Link? = nil) {
    self.init(unsafeResultMap: ["__typename": "Launch", "mission_name": missionName, "launch_year": launchYear, "launch_date_local": launchDateLocal, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var missionName: String? {
    get {
      return resultMap["mission_name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "mission_name")
    }
  }

  public var launchYear: String? {
    get {
      return resultMap["launch_year"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "launch_year")
    }
  }

  public var launchDateLocal: String? {
    get {
      return resultMap["launch_date_local"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "launch_date_local")
    }
  }

  public var rocket: Rocket? {
    get {
      return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
    }
  }

  public var links: Link? {
    get {
      return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "links")
    }
  }

  public struct Rocket: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["LaunchRocket"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("rocket_name", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rocketName: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket_name": rocketName])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var rocketName: String? {
      get {
        return resultMap["rocket_name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "rocket_name")
      }
    }
  }

  public struct Link: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["LaunchLinks"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("video_link", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videoLink: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "LaunchLinks", "video_link": videoLink])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var videoLink: String? {
      get {
        return resultMap["video_link"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "video_link")
      }
    }
  }
}
