//
//  MovieDetailsViewController.swift
//  Flixter
//
//  Created by EatMoreOranges on 12/16/19.
//  Copyright © 2019 EatMoreOranges. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    
    var movie: [String:Any]! // != swift optionals... look it up
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(movie["title"])
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
