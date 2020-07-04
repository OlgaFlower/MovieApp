//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    var filmID: Int?
    let presenter = DetailsPresenter()
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchData(filmID)
    }
    
    
}
