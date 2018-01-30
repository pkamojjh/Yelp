//
//  BusinessCell.swift
//  Yelp
//
//  Created by Pallav Kamojjhala on 1/29/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    
    @IBOutlet weak var ratingsIMG: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            if let bURL = business.imageURL {
                
                thumbImageView.setImageWith(bURL)
            }
            ratingsLabel.text = "\(business.reviewCount!) Reviews"
            catLabel.text = business.categories
            addressLabel.text = business.address
            distanceLabel.text = business.distance
            ratingsIMG.setImageWith(business.ratingImageURL!)
            
        }
    }
    override func awakeFromNib() {
        
    
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
