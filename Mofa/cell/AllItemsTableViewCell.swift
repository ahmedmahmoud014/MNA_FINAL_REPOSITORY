//
//  AllItemsTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class AllItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var separator: UIView!
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemValue : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addValue(itemTitle :String , itemValue : String , showView : Bool) {
        self.itemTitle.text = itemTitle;
        self.itemValue.text  =  itemValue
        separator.isHidden   = showView
    }
}
