//
//  UIImage + loadFromURL.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension UIImage {
    
    public static func loadImageFrom(url: URL, complition: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    complition(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    complition(nil)
                }
            }
        }
    }
}
