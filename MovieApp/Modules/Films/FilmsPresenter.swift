//
//  FilmsPresenter.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

protocol ConfigureFilmCellProtocol: class {
    func configureCell(_ cell: FilmTableViewCellProtocol, _ film: Film)
}

import UIKit

class FilmsPresenter: ConfigureFilmCellProtocol {
    
    func configureCell(_ cell: FilmTableViewCellProtocol, _ ratedFilm: Film) {
        guard let title = ratedFilm.title, let date = ratedFilm.releaseDate else { return }
        cell.displayTitle(title)
        cell.displayReleaseDate(date.dateFormatter())
    }
    
    func addSpinner(_ width: CGFloat) -> UIView {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: width, height: CGFloat(44))
        return spinner
    }
}
