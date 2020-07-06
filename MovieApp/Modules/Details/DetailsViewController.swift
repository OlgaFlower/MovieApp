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
    @IBOutlet weak var messageView: UIView!
    //Field
    @IBOutlet weak var detailsStackView: UIStackView!
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
        messageView.isHidden = true
        
        presenter = DetailsPresenter()
        presenter.fetchData(filmID)
        
        presenter.updateDetails { data, error in
            if data != nil {
                guard let info = data else { return }
                self.setup(info)
            }
            if error != nil {
                self.displayErrorAndReturn(error!)
            }
        }
    }
    
    //MARK: - Setup UI
    func setup(_ info: DetailsModel) {
        setupImageView(info.imageURL)
        setupLabels(info)
        setupFields()
        setupTitle()
    }
    
    func setupLabels(_ info: DetailsModel) {
        self.dateLabel.text = info.releaseDate?.dateFormatter()
        self.titleLabel.text = info.title
        self.tagLabel.text = info.tagLine
        self.overviewLabel.text = info.overview
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
        releaseLabel.text = "Released:"
    }
    
    func setupTitle() {
        navigationItem.title = "Details"
    }
    
    //MARK: - Methods
    func displayErrorAndReturn(_ error: String) {
        self.detailsStackView.isHidden = true
        messageView.displayErrorView(error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
