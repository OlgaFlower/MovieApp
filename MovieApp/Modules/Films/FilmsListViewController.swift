//
//  FilmsListViewController.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FilmsListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    let apiClient = NetworkClient()
    var ratedFilms = RatedFilms()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiClient.fetchTopRatedFilms()
        apiClient.completionHandler { [weak self] (ratedFilms, status, message) in
            if status {
                guard let films = ratedFilms else { return }
                self?.ratedFilms = films
                self?.tableView.reloadData()
            }
        }
        
    }
}

extension FilmsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratedFilms.films?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmTableViewCell
        
        guard let film = ratedFilms.films?[indexPath.row] else { return UITableViewCell() }
        cell.label.text = film.title
        return cell
    }
    
}
