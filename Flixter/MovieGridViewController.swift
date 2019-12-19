//
//  MovieGridViewController.swift
//  Flixter
//
//  Created by EatMoreOranges on 12/16/19.
//  Copyright © 2019 EatMoreOranges. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [[String:Any]]()
            
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // step 3.
        collectionView.delegate = self
        collectionView.dataSource = self
                
        // Do any additional setup after loading the view.
        // API link https://developers.themoviedb.org/3/movies/get-similar-movies
                
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1")! // minus &language=en-US&page=1
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
               print(error.localizedDescription)
            } else if let data = data {
               let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //
               self.movies = dataDictionary["results"] as! [[String:Any]]
               //"as! blah blah..." is casting
               // had a problem and clicked fix and it added "self."
                            
              /* ESTÁ MUY IMPORTANTE */
              //bellow is how to load/update the data to be used
              self.collectionView.reloadData()
              print(self.movies)
                            
        }
    }
        task.resume()
        
        
        
        
    }
    

    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
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
