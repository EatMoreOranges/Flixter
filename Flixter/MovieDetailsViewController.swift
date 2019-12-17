//
//  MovieDetailsViewController.swift
//  Flixter
//
//  Created by EatMoreOranges on 12/16/19.
//  Copyright © 2019 EatMoreOranges. All rights reserved.
//

import UIKit
import AlamofireImage //helps you download images from internet
class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    
    var movie: [String:Any]! // != swift optionals... look it up
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        print(movie["title"])
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit() // this will grow the label to fit all the words
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()

        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        // how to get poster image from internet
        let poster_path = movie["poster_path"] as! String
        let poster_URL = URL(string: baseURL + poster_path)!
        posterView.af_setImage(withURL: poster_URL) //to use af_setimage need to import alamofireImage
        
        // how to get backdrop image from internet
        let backdrop_path = movie["backdrop_path"] as! String
        let backdrop_URL = URL(string: "https://image.tmdb.org/t/p/w780" + backdrop_path)!
        backdropView.af_setImage(withURL: backdrop_URL) //to use af_setimage need to import alamofireImage

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
