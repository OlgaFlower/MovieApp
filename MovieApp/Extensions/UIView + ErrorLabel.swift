//
//  UIView + ErrorLabel.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 05.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension UIView {
    //Display App Error
    func displayErrorView(_ message: String) {
        let errorMessageLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.numberOfLines = 0
            label.textColor = .white
            return label
        }()
        self.isHidden = false
        self.layer.cornerRadius = 7
        self.addSubview(errorMessageLabel)
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorMessageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        let constraints = [
            errorMessageLabel.widthAnchor.constraint(equalToConstant: self.frame.width)
        ]
        NSLayoutConstraint.activate(constraints)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.isHidden = true
        }
    }
    
}
