//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/6/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var air_date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
