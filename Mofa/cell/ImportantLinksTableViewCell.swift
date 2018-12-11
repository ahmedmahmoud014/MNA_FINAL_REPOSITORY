//
//  ImportantLinksTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-04.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ImportantLinksTableViewCell: UITableViewCell {

    @IBOutlet weak var separator: UIView!
   // @IBOutlet var serviceName: UILabel!
    @IBOutlet var serviceUrl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addValue(rowdata :String,link :String , showView : Bool) {
        //serviceName.text = rowdata;
        serviceUrl.text = link ;
        if(showView){
           // separator.isHidden = true
        }else{
         //   separator.isHidden = false
            
        }
        
        
    }

}
