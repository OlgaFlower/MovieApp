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
    
    //MARK: - Outlets
    //Field
    @IBOutlet weak var releaseLabel: UILabel!
    
    //Details
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //MARK: - Properties
    var presenter: DetailsPresenter!
    var filmID: Int?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Details"
        presenter = DetailsPresenter()
        presenter.fetchData(filmID)
        
        presenter.updateDetails { details in
            if details != nil {
                guard let info = details else { return }
                self.setup(info)
            }
            else {
                //TODO - HANDLE ERROR*********
            }
        }
        
    }
    
    func setup(_ info: FilmInfoModel) {
        print("title: \(info.title), imageURL: \(info.imageURL)")
        self.dateLabel.text = info.releaseDate
        self.titleLabel.text = info.title
        self.tagLabel.text = info.tagLine
        self.overviewLabel.text = info.overview
        setupImageView(info.imageURL)
    }
    
    func setupImageView(_ imageURL: String?) {
        guard let urlString = imageURL else {
            filmImage.isHidden = true
            return
        }
        guard let url = URL(string: APISource.shared.baseImageURL + urlString) else { return }
        UIImage.loadImageFrom(url: url) { image in
            self.filmImage.image = image
        }
    }
    
    func setupFields() {
        releaseLabel.text = "Release:"
        
    }
    
}
