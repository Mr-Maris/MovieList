//
//  DetailViewController.swift
//  MovieList
//
//  Created by Maris Rasnacs on 04/02/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    var film: Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if film != nil {
            movieImageView.image = UIImage(named: film.fullDetail)
            movieNameLabel.text = film.movie + " - " + film.fullDetail
            movieNameLabel.numberOfLines = 0
        }

       
        
    }
    
}
   
