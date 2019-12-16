//
//  MoviesViewController.swift
//  Flixter
//
//  Created by EatMoreOranges on 12/15/19.
//  Copyright © 2019 EatMoreOranges. All rights reserved.
//

import UIKit
import AlamofireImage //used coco pods to get this library in my workspace

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // TableVeiw Recipe_Step 1:
    // added UITablViewDataSource & UITableViewDelegate ... lets the veiwControler work with the table view
    //and clicked fix (added tableView functions)



    @IBOutlet weak var TableView: UITableView!
    
//---------------------------------------------
// vars created up here are called Properties
// Properties are available for the "life time of the screen"
    var movies = [[String:Any]]()
    // This is an array of dictionaries
    // [keyType:valueType]
    // () = creation of something
//---------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //TableVeiw Recipe_Step 3: add these things
        TableView.dataSource = self
        TableView.delegate = self
        
//        The power of APIs
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//        print("hello")
            
            print(dataDictionary)
            self.movies = dataDictionary["results"] as! [[String:Any]]
            //"as! blah blah..." is casting
            // had a problem and clicked fix and it added "self."
            
            
            //TableVeiw Recipe_Step 4: Reload data
            self.TableView.reloadData() // makes sure the table actually gets the data from the Tableview functions
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

            
            
           }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    //TableVeiw Recipe_Step 2: (create these functions)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count // it wants the number of rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        // helps to save memory by reusing cells off screen
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
// 1st edit -->     cell.textLabel!.text = "row: \(indexPath.row)"  // "...\()" = special formula for turning vars to strings //i clicked fix
// 2nd edit -->      cell.textLabel!.text = title // WE HAVE LIFT OFF!!!! for title names
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        
//        Movie API documentation https://developers.themoviedb.org/3/getting-started/images
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let poster_path = movie["poster_path"] as! String
        let poster_URL = URL(string: baseURL + poster_path)!
        
        cell.posterView.af_setImage(withURL: poster_URL)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
