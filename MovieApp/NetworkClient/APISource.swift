//
//  APISource.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

//Top rated
//https://api.themoviedb.org/3/discover/movie/?certification_country=US&certification=R&sort_by=vote_average.desc&api_key=00dc39f3a2f7cefcd9dec673d6d89140

//find by id
//https://api.themoviedb.org/3/movie/718507?api_key=00dc39f3a2f7cefcd9dec673d6d89140

//Image path
//https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png



import Foundation

final class APISource {
    
    static let shared = APISource()
    
    private let apiKey = "00dc39f3a2f7cefcd9dec673d6d89140"
    let keyParameter = "&api_key="
    let pageParameter = "&page="
    let baseURL = "https://api.themoviedb.org/3/"
//    let baseImagebackdropURL = "https://image.tmdb.org/t/p/w500"
    let baseImagebackdropURL = "https://image.tmdb.org/t/p/original"
    let topRatedFilmsParametres = "discover/movie/?certification_country=US&certification=R&sort_by=vote_average.desc"
    
    
    func ratedFilmsURL(_ page: Int) -> String? {
        let page = String(page)
        return baseURL + topRatedFilmsParametres + pageParameter + page + keyParameter + apiKey
    }
    
}
