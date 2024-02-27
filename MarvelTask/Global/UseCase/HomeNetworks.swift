//
//  HomeNetworks.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation
import Alamofire

enum HomeNetworks {
    case getHomeData
    case getHomeDetails(id : String)
}

extension HomeNetworks: TargetType {

    var baseUrl: String {
        switch self {
        case .getHomeData:
            return URLs.home
        case .getHomeDetails(let id):
            return URLs.home + "/" + id
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getHomeData:
            return .get
        case .getHomeDetails:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getHomeData:
            return .plainRequest
        case .getHomeDetails:
            return .plainRequest
        }
    }

    var headers: Alamofire.HTTPHeaders? {
        switch self {
        default :
            return [:]
        }
    }
}
