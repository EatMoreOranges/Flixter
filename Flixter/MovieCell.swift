//
//  MovieCell.swift
//  Flixter
//
//  Created by EatMoreOranges on 12/15/19.
//  Copyright © 2019 EatMoreOranges. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
// (for the outlets bellow) to correctly contorl drag i had to do alot of file connections
//  not hard , but just watch the "Custom cells" video again
// i was changing automatic stuff and assigning swift files to views etc
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
