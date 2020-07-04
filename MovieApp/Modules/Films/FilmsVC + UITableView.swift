//
//  FilmsVC + UITableView.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension FilmsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratedFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmTableViewCell
        presenter.configureCell(cell, ratedFilms[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = ratedFilms[indexPath.row]
        
        let detailVC: DetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailVC.filmID = selectedItem.id
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //Pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == ratedFilms.count - 1 {
            
            guard let totalPages = totalFilmsPages else { return }
            
            if page < totalPages {
                apiClient.fetchTopRatedFilms(page + 1)
                apiClient.topRatedHandler { [weak self] (ratedFilms, status, message) in
                    if status {
                        
                        tableView.tableFooterView = self?.presenter.addSpinner(tableView.bounds.width)
                        tableView.tableFooterView?.isHidden = false
                        
                        guard let filmsInfo = ratedFilms else { return }
                        guard let films = filmsInfo.films else { return }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            self?.ratedFilms.append(contentsOf: films)
                            self?.totalFilmsPages = filmsInfo.totalPages
                            
                            DispatchQueue.main.async {
                                //Hide spinner
                                tableView.tableFooterView?.isHidden = true
                                self?.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}

