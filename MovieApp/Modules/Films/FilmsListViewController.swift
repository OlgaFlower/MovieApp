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
    let source = APISource.shared
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchTopRatedFilms()
        
    }
    
    func fetchTopRatedFilms() {
        guard let url = URL(string: source.baseURL + source.topRatedFilmsParametres + source.apiKey) else {
            print("could not form url")
            return
        }
        
        AF.request(url).responseJSON { (response) in
            if let jsonData = response.value as? [String : Any] {
                print(jsonData)
            }
        }
        
    }
    

}


extension FilmsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmTableViewCell
        
        return cell
    }
    
    
    
}
