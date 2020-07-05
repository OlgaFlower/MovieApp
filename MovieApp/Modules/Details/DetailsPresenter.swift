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
    var updateDetailsCallback: ((DetailsModel?, String?) -> Void)?
    
    //MARK: - Callback
    func updateDetails(update: @escaping ((DetailsModel?, String?) -> Void)) {
        self.updateDetailsCallback = update
    }
    
    func fetchData(_ id: Int?) {
        guard let id = id else { return }
        apiClient.fetchFilmsInfo(id)
        
        apiClient.filmInfoHandler { [weak self] (data, status, error) in
            if status {
                guard let recievedInfo = data else { return }
                self?.updateDetailsCallback?(recievedInfo, nil)
            } else {
                self?.updateDetailsCallback?(nil, UserErrors.noInternet.message)
                print(UserErrors.noInternet.message)
            }
        }
    }
}
