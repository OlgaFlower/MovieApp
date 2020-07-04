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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    
    //MARK: - Properties
    var presenter: DetailsPresenter!
    var filmID: Int?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailsPresenter()
        presenter.fetchData(filmID)
        presenter.updateDetails { details in
            if details != nil {
                guard let info = details else { return }
                self.dateLabel.text = info.releaseDate
                self.titleLabel.text = info.title
            }
            else {
                print("details = nil")
            }
        }
        
    }
    
}
