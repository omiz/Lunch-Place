//
//  PlaceItemTableViewCell.swift
//  Lunch
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit
import Lunch_Data

class PlaceItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        accessoryView = UIImageView(image: UIImage(named: "icon-heart"), highlightedImage: UIImage(named: "icon-heart-selected"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ item: EatingPlace?) {
        
    }
    
}
