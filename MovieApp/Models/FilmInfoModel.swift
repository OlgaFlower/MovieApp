//
//  FilmInfo.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

struct FilmInfoModel: Codable {
    var genres: [Genre]?
    var posterURL: String?
    var title: String?
    var productionCompanies: [Company]
    var productionCountries: [Country]
    var releaseDate: String?
    var tagLine: String?
    var voteAverage: Double?
    
    private enum CodingKeys: String, CodingKey {
        case genres
        case posterURL = "poster_path"
        case title = "original_title"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case tagLine = "tagline"
        case voteAverage = "vote_average"
    }
}

struct Genre: Codable {
    var name: String?
}

struct Company: Codable {
    var name: String?
}

struct Country: Codable {
    var name: String?
}
