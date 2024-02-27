//
//  HomeAPI.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation

class HomeAPI: BaseAPI<HomeNetworks> {
    func getHomeData(completion: @escaping(Result<NewsBannerModel?, NSError>) -> Void)
}
