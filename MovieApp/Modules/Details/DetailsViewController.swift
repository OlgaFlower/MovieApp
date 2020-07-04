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
    
    @IBOutlet weak var contentView: DetailView!
    
    //MARK: - Properties
    var filmID: Int?
    let presenter = DetailsPresenter()
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchData(filmID)
        loadNibView()
    }
    
    func loadNibView() {
        let myView = Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)![0] as! UIView
        contentView .addSubview(myView)
    }
}
