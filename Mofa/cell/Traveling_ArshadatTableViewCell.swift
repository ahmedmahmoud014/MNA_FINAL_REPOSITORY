//
//  Traveling_ArshadatTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-15.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class Traveling_ArshadatTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var adviceValue: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addValues(tilteValue  : String ,value : String){
        titleLbl.text   =  tilteValue
        adviceValue.text = value
    }

}
