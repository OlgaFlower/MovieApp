//
//  UIView + ErrorLabel.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 05.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension UIView {
    
    func displayErrorView(_ message: String) {
        let errorMessageLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.numberOfLines = 0
            label.textColor = .white
            return label
        }()
        self.addSubview(errorMessageLabel)
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorMessageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        let constraints = [
            errorMessageLabel.widthAnchor.constraint(equalToConstant: 300)
        ]
        NSLayoutConstraint.activate(constraints)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = message
    }
    
}
