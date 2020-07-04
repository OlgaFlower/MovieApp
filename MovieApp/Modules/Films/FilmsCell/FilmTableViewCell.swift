//
//  FilmTableViewCell.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

protocol FilmTableViewCellProtocol {
    func displayFilmImage(_ imageURL: String?)
    func displayTitle(_ title: String)
    func displayReleaseDate(_ date: String)
}

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        resetContent()
        setupImageView()
    }

    func resetContent() {
        filmImage.image = nil
        filmNameLabel.text = nil
        releaseDate.text = nil
    }
    
    func setupImageView() {
        filmImage.layer.cornerRadius = 8
    }
}

extension FilmTableViewCell: FilmTableViewCellProtocol {
    
    func displayFilmImage(_ imageURL: String?) {
        guard let urlString = imageURL else { return }
        guard let url = URL(string: APISource.shared.baseImagebackdropURL + urlString) else { return }
        UIImage.loadImageFrom(url: url) { image in
            self.filmImage.image = image
        }
    }
    
    func displayTitle(_ title: String) {
        filmNameLabel.text = title
    }
    
    func displayReleaseDate(_ date: String) {
        releaseDate.text = date
    }
}
