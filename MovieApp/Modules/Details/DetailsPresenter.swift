//
//  DetailsPresenter.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

class DetailsPresenter {
    //MARK: - Properties
    let apiClient = NetworkClient()
    var updateDetailsCallback: ((FilmInfoModel?) -> Void)?
    
    //MARK: - Callback
    func updateDetails(update: @escaping ((FilmInfoModel?) -> Void)) {
        self.updateDetailsCallback = update
    }
    
    func fetchData(_ id: Int?) {
        guard let id = id else { return }
        apiClient.fetchFilmsInfo(id)
        
        apiClient.filmInfoHandler { [weak self] (filmInfo, status, message) in
            if status {
                guard let recievedInfo = filmInfo else { return }
                self?.updateDetailsCallback?(recievedInfo)
            }
        }
    }
}
