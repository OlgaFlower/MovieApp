//
//  FilmsPresenter.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class FilmsPresenter {
    
    func addSpinner(_ width: CGFloat) -> UIView {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: width, height: CGFloat(44))
        return spinner
    }
    
}
