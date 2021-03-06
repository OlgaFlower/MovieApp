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
    
    //MARK: - Properties
    let source = APISource.shared
    
    typealias filmsCallback = (_ films: RatedFilms?, _ status: Bool, _ message: String) -> Void
    typealias detailsCallback = (_ film: DetailsModel?, _ status: Bool, _ message: String) -> Void
    
    var topRatedCallback: filmsCallback?
    var filmInfocallback: detailsCallback?
    
    //MARK: - Callback
    func topRatedHandler(callback: @escaping filmsCallback) {
        self.topRatedCallback = callback
    }

    func filmInfoHandler(callback: @escaping detailsCallback) {
        self.filmInfocallback = callback
    }
    
    
    //MARK: - Top Rated Films
    func fetchTopRatedFilms(_ page: Int) {
        
        guard let url = APISource.shared.ratedFilmsURL(page) else { return }
        
        AF.request(url).response { responseData in
            guard let data = responseData.data else {
                self.topRatedCallback?(nil, false, "")
                print(NetworkErrors.URLerror.message)
                return
            }
            do {
                let ratedFilms = try JSONDecoder().decode(RatedFilms.self, from: data)
                self.topRatedCallback?(ratedFilms, true, "")
            } catch {
                self.topRatedCallback?(nil, false, UserErrors.noData.message)
                print(error)
            }
        }
    }
    
    //MARK: - Film Info
    func fetchFilmsInfo(_ id: Int) {
        
        guard let url = APISource.shared.filmInfo(id) else { return }
        
        AF.request(url).response { responseData in
            guard let data = responseData.data else {
                self.filmInfocallback?(nil, false, "")
                return }
            do {
                let info = try JSONDecoder().decode(DetailsModel.self, from: data)
                self.filmInfocallback?(info, true, "")
            } catch {
                self.filmInfocallback?(nil, false, error.localizedDescription)
            }
        }
    }
}
