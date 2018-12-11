//
//  RepresentationDetailsTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-18.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class RepresentationDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var actionImage: UIImageView!
    @IBOutlet weak var representationItemsValues: UITextView!
    @IBOutlet weak var representationItems: UILabel!
     //@IBOutlet weak var representationItemsValues: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  addValue(itemName : String ,itemImag : String , itemValue : String,actionImageValue  :  String  ){
        representationItems.text = itemName
        representationItemsValues.text = itemValue
        itemImage.image = UIImage(named: itemImag)
        actionImage.image = UIImage(named: actionImageValue)

    }

}
