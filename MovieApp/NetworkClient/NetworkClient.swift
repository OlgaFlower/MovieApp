//
//  NetworkClient.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient {
    
    //MARK: Properties
    typealias topRatedFilmsCallback = (_ films: RatedFilms?, _ status: Bool, _ message: String) -> Void
    
    var callback: topRatedFilmsCallback?
    let source = APISource.shared
    
    //MARK:
    func fetchTopRatedFilms(_ page: Int) {
        
        guard let url = APISource.shared.ratedFilmsURL(page) else { return }
        
        
        AF.request(url).response { responseData in
            guard let data = responseData.data else {
                self.callback?(nil, false, "")
                return }
            do {
                let ratedFilms = try JSONDecoder().decode(RatedFilms.self, from: data)
                self.callback?(ratedFilms, true, "")
            } catch {
                self.callback?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callback: @escaping topRatedFilmsCallback) {
        self.callback = callback
    }
    
    
    
    
    
//    typealias filmsInfoCallback = (_ film: FilmInfoModel?, _ status: Bool, _ message: String) -> Void
//
//    var filmInfocallback: filmsInfoCallback?
//
//    func fetchFilms(_ page: Int?, _ id: Int?, type: TypesModel) {
//
//    }

    
    
    
}
