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
    
    let baseURL = "https://api.themoviedb.org/3/"
    
    //Key
    private let apiKey = "00dc39f3a2f7cefcd9dec673d6d89140"
    let keyParameter = "api_key="
    
    //Rated films parametres
    let topRatedFilmsParametres = "discover/movie/?certification_country=US&certification=R&sort_by=vote_average.desc"
    let pageParameter = "&page="
    
    //Image URL
    let baseImageURL = "https://image.tmdb.org/t/p/original"
    
    //Film Info
    let infoParametre = "movie/"
    
    func ratedFilmsURL(_ page: Int) -> String? {
        let page = String(page)
        return baseURL + topRatedFilmsParametres + pageParameter + page + "&" + keyParameter + apiKey
    }
    
    func filmInfo(_ id: Int) -> String? {
        let id = String(id)
        return baseURL + infoParametre + id + "?" + keyParameter + apiKey
    }
}
