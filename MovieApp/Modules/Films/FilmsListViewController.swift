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
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
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
        setupNavBar()
        setupTableView()
        
        apiClient.fetchTopRatedFilms(page)
        apiClient.topRatedHandler { [weak self] (ratedFilms, status, error) in
            if !status && error == "" {
                self?.displayErrorLabel(UserErrors.noData.message)
            }
            if status {
                guard let filmsInfo = ratedFilms else { return }
                guard let films = filmsInfo.films else {
                    print(NetworkErrors.JSONerror.message)
                    self?.displayErrorLabel(UserErrors.noData.message)
                    return
                }
                self?.ratedFilms = films
                guard let pagesCount = filmsInfo.totalPages else { return }
                self?.totalPages = pagesCount
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
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
    
    func displayErrorLabel(_ message: String) {
        view.addSubview(errorMessageLabel)
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorMessageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        let constraints = [
            errorMessageLabel.widthAnchor.constraint(equalToConstant: 300)
        ]
        NSLayoutConstraint.activate(constraints)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = message
    }
}


