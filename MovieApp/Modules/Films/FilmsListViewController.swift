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
    var page = 1
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        apiClient.fetchTopRatedFilms(page)
        apiClient.topRatedHandler { [weak self] (ratedFilms, status, message) in
            if status {
                guard let filmsInfo = ratedFilms else {
                    print("NO filmsInfo")
                    return
                }
                guard let films = filmsInfo.films else {
                    print("NO films")
                    return
                }
                self?.ratedFilms = films
                self?.totalFilmsPages = filmsInfo.totalPages
                guard let page = filmsInfo.page else {
                    print("NO page")
                    return
                }
                self?.page = page
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeBackTitle()
    }
    
    //MARK: - Methods
    func setupNavBar() {
        navigationItem.title = "Top Rated Films"
    }
    
    func removeBackTitle() {
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    func setupTableView() {
//        tableView.prefetchDataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
    
}


