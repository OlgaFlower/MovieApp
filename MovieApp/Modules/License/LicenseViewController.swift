//
//  ViewController.swift
//  MovieApp
//
//  Created by Olha Bereziuk on 03.07.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class LicenseViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var licenseTextLabel: UILabel!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbarAppearence()
        licenseTextLabel.text = Constants.shared.license
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupButton(agreeButton)
        setupButton(cancelButton)
    }
    
    //MARK: - Setup UI
    func setupNavbarAppearence() {
        let navBar = navigationController?.navigationBar
        navBar?.tintColor = .white
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
    }
    
    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
    }

    //MARK: - Actions
    @IBAction func agreeTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let filmsVC = storyBoard.instantiateViewController(withIdentifier: "FilmsListViewController") as! FilmsListViewController
        self.navigationController?.pushViewController(filmsVC, animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        showQuitAlert(title: "Quit the App", message: "Are you sure?")
    }
}

