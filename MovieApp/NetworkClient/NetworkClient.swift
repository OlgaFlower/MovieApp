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
    func fetchTopRatedFilms() {
        guard let url = URL(string: source.baseURL + source.topRatedFilmsParametres + source.apiKey) else {
            print("could not form url")
            return
        }
        
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
    
}
