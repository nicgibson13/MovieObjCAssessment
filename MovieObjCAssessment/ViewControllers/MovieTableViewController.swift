//
//  MovieTableViewController.swift
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        


        return cell
    }
}
