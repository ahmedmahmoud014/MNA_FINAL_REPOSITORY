//
//  InQueryListItemTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-31.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class InQueryListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!

    @IBOutlet weak var bullet: UIImageView!
    @IBOutlet weak var setionTitle: UILabel!
    
    func   assignValues(inqueryItems :InqueryItems  , show :Bool){
    titleLbl.text   = inqueryItems.title!
        if inqueryItems.value! ==  "منتهية"{
    valueLbl.text   = inqueryItems.value!
            valueLbl.textColor  =  UIColor.red

            
        }else {
            valueLbl.text   = inqueryItems.value!

        }
    separator.isHidden = show

    }
    
    func   assignValues(inqueryItems :InqueryItems  , show :Bool,hideBullot :  Bool){
        titleLbl.text   = inqueryItems.title!
        if inqueryItems.value! ==  "منتهية"{
            valueLbl.text   = inqueryItems.value!
            valueLbl.textColor  =  UIColor.red

        }else {
            valueLbl.text   = inqueryItems.value!
            
        }
        separator.isHidden = show
        
   
        bullet.isHidden =  hideBullot
        
    }
    
    func   assignValues(inqueryItems :InqueryItems){
        setionTitle.text   = inqueryItems.title!
    }

}
