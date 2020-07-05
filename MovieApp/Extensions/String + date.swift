//
//  String + Date.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 05.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

extension String {
    //2020-08-18 into 2020
    func dateFormatter() -> String {
        let range = self.startIndex ..< self.index(self.startIndex, offsetBy: 4)
        return String(self[range])
    }
}
