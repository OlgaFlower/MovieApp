//
//  Errors.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 05.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

enum NetworkErrors {
    case URLerror
    case JSONerror
    
    var message: String {
        switch self {
        case .URLerror  : return "A server with the specified hostname could not be found."
        case .JSONerror : return "Error fetching JSON."
        }
    }
}


enum UserErrors {
    case noData
    case noInternet
    
    var message: String {
        switch self {
        case .noData     : return "Something went wrong... Houston we have a problem."
        case .noInternet : return "The Internet connection appears to be offline."
        }
    }
}
