//
//  HomeModel.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation

struct HomeModel: Codable {
    let albumId, id: Int
    let title: String
    let url, thumbnailUrl: String
}

typealias HomeData = [HomeModel]
