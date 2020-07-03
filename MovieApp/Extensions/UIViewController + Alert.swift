//
//  UIViewController + Alert.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionNO = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        let actionYES = UIAlertAction(title: "YES", style: .default, handler: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                exit(0)
            }
            
        })
        alert.addAction(actionNO)
        alert.addAction(actionYES)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
