//
//  FilmsListViewController.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit
import Alamofire

class FilmsListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    let apiClient = NetworkClient()
    let presenter = FilmsPresenter()
    var ratedFilms = [Film]()
    //Pagination data
    var totalFilmsPages: Int?
    var page: Int?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        apiClient.fetchTopRatedFilms(1)
        apiClient.topRatedHandler { [weak self] (ratedFilms, status, message) in
            if status {
                guard let filmsInfo = ratedFilms else { return }
                guard let films = filmsInfo.films else { return }
                self?.ratedFilms = films
                self?.totalFilmsPages = filmsInfo.totalPages
                self?.page = filmsInfo.page
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
    
}


