//
//  AttatchmentTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class AttatchmentTableViewCell: UITableViewCell {

    @IBOutlet weak var delete: UIImageView!
    @IBOutlet weak var imageValue: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func  assign(image :  UIImage){
        imageValue.image =  image
    }

}
