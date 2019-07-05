//
//  MovieTableViewController.swift
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        let movie = movies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieOverviewTextView.text = movie.overview
        cell.movieRatingLabel.text = "\(movie.rating)"
        MovieController.shared().fetchImage(movie) { (image) in
            DispatchQueue.main.async {
                cell.movieImage.image = image
            }
        }
        return cell
    }
}

extension MovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, searchTerm != "" else {return}
        MovieController.shared().fetchMovie(withTerm: searchTerm) { (movies) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                searchBar.text = ""
            }
        }
    }
}

