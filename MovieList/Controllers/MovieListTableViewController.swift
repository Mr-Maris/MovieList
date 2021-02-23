//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Maris Rasnacs on 04/02/2021.
//

import UIKit
import SwiftUI

class MovieListTableViewController: UITableViewController {

    var films = Film.createMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // Uncomment the following line to preserve selection between presentations
             self.clearsSelectionOnViewWillAppear = true

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
             self.navigationItem.rightBarButtonItem = self.editButtonItem
        }

        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return films.count
        }

        
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath)

            // Configure the cell...
    //        cell.textLabel?.text = trackList[indexPath.row]
    //        cell.textLabel?.numberOfLines = 0
    //        cell.detailTextLabel?.text = trackList[indexPath.row]
    //        cell.imageView?.image = UIImage(named: trackList[indexPath.row])
            
            let film = films[indexPath.row]
            cell.textLabel?.text = film.movie
            cell.detailTextLabel?.text = film.genre
            cell.imageView?.image = UIImage(named: film.fullDetail)
            
            return cell
        }
        

        
        // MARK: - Table view Delegate
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
        
        
        /*
        // Override to support conditional editing of the table view.
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        */

        /*
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        */

        
        // Override to support rearranging the table view.
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
            let cuurentMovie = films.remove(at: fromIndexPath.row)
            films.insert(cuurentMovie, at: to.row)
        }
        
        
        // Override to support conditional rearranging of the table view.
        override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the item to be re-orderable.
            return true
        }
        
        override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .none
        }
        

        
        // MARK: - Navigation
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let indexPath = tableView.indexPathForSelectedRow {
                print("indexPath.row: ", indexPath.row)
            // Get the new view controller using segue.destination.
                let detailVC = segue.destination as! DetailViewController
            // Pass the selected object to the new view controller.
                detailVC.film = films[indexPath.row]
            }
        }
        
}
