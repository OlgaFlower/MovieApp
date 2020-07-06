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
    @IBOutlet weak var messageView: UIView!
    
    //MARK: - Properties
    let apiClient = NetworkClient()
    let presenter = FilmsPresenter()
    var ratedFilms = [Film]()
    //Pagination data
    var totalPages = 0
    var page = 1
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        messageView.isHidden = true
        setupNavBar()
        setupTableView()
        
        apiClient.fetchTopRatedFilms(page)
        apiClient.topRatedHandler { [weak self] (data, status, error) in
            
            if status {
                guard let filmsInfo = data else { return }
                guard let films = filmsInfo.films else {
                    print(NetworkErrors.JSONerror.message)
                    self?.displayErrorAndReturn(UserErrors.noData.message)
                    return
                }
                self?.ratedFilms = films
                guard let pagesCount = filmsInfo.totalPages else { return }
                self?.totalPages = pagesCount
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            if !status && error.isEmpty {
                self?.displayErrorAndReturn(UserErrors.noInternet.message)
            }
            
            if data == nil && !error.isEmpty {
                self?.displayErrorAndReturn(UserErrors.noData.message)
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
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
    
    func displayErrorAndReturn(_ error: String) {
        messageView.displayErrorView(error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}


