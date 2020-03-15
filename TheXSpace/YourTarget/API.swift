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
        details
        id
      }
      launchesUpcoming {
        __typename
        details
        id
      }
    }
    """

  public let operationName: String = "loadingLaunches"

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
        GraphQLField("details", type: .scalar(String.self)),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(details: String? = nil, id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "details": details, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }

    public struct LaunchesUpcoming: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("details", type: .scalar(String.self)),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(details: String? = nil, id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "details": details, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}
