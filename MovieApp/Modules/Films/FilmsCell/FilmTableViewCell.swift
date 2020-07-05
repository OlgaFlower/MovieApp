//
//  FilmTableViewCell.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 04.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

protocol FilmTableViewCellProtocol {
    func displayTitle(_ title: String)
    func displayReleaseDate(_ date: String)
}

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
//        resetContent()
    }

    func resetContent() {
        filmNameLabel.text = nil
        releaseDate.text = nil
    }
}

extension FilmTableViewCell: FilmTableViewCellProtocol {
    
    func displayTitle(_ title: String) {
        filmNameLabel.text = title
    }
    
    func displayReleaseDate(_ date: String) {
        releaseDate.text = date
    }
}
