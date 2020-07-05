//
//  DetailsModel.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

struct DetailsModel: Codable {
    var imageURL: String?
    var title: String?
    var releaseDate: String?
    var tagLine: String?
    var overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case imageURL = "poster_path"
        case title = "original_title"
        case releaseDate = "release_date"
        case tagLine = "tagline"
        case overview
    }
}
