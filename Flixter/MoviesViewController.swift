//
//  MoviesViewController.swift
//  Flixter
//
//  Created by EatMoreOranges on 12/15/19.
//  Copyright © 2019 EatMoreOranges. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
// vars created up here are called Properties
// Properties are available for the "life time of the screen"
    
    var movies = [[String:Any]]()
    
    // This is an array of dictionaries
    // [keyType:valueType]
    // () = creation of something
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()

        // Do any additional setup after loading the view.
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
