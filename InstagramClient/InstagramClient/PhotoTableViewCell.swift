//
//  PhotoTableViewCell.swift
//  InstagramClient
//
//  Created by Jeremiah Lee on 2/3/16.
//  Copyright © 2016 Jeremiah Lee. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
