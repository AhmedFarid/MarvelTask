//
//  HomeAPI.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation

class HomeAPI: BaseAPI<HomeNetworks> {
    func getHomeData(completion: @escaping(Result<HomeData?, NSError>) -> Void) {
        self.fetchData(target: .getHomeData, responseType: HomeData.self) { result in
            completion(result)
        }
    }

    func getHomeDateiles(id: String, completion: @escaping(Result<HomeData?, NSError>) -> Void) {
        self.fetchData(target: .getHomeDetails(id: id), responseType: HomeData.self) { result in
            completion(result)
        }
    }
}
