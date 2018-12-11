//
//  HomePageTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    @IBOutlet weak var itemIcone: UIImageView!
    @IBOutlet weak var separator: UIView!
    @IBOutlet var serviceName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
   // 005e86
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func addValue(rowdata :String , showView : Bool, itemIconName : String , separatorColor : UInt) {
        itemIcone.image = UIImage(named : itemIconName )
        serviceName.text = rowdata;
        serviceName.textColor  =  UIColor.black
//        if(showView){
          separator.isHidden = showView
//        }else{
//            separator.isHidden = false
//            separator.backgroundColor =  UIColorFromRGB(rgbValue:0xc9c9c9)
//
//        }
        
        
    }

}
