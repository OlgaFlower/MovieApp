//
//  RatedFilmsModel.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

struct RatedFilms: Codable {
    var totalPages: Int?
    var page: Int?
    var films: [Film]?

    private enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case page
        case films = "results"
    }
}

struct Film: Codable {
    var id: Int?
    var title: String?
    var releaseDate: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
    }
}


