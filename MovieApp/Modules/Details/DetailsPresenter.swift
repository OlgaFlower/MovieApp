//
//  DetailsPresenter.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

class DetailsPresenter {
    
    let apiClient = NetworkClient()
    var info = FilmInfoModel()
    
    func fetchData(_ id: Int?) {
        guard let id = id else { return }
        apiClient.fetchFilmsInfo(id)
        
        apiClient.filmInfoHandler { [weak self] (filmInfo, status, message) in
            if status {
                guard let recievedInfo = filmInfo else { return }
                self?.info = recievedInfo
                print(self?.info)
            }
        }
    }

    
}
