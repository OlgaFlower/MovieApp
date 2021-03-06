//
//  RatedFilmsModel.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

//Top Rated Films
struct RatedFilms: Codable {
    var totalPages: Int?
    var page: Int?
    var films: [Film]?
    
    ///Uncoment it for another scenario
//    var x: Int
    
    private enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case page
        case films = "results"
//        case x
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


