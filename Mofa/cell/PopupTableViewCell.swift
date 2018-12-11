//
//  PopupTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class PopupTableViewCell: UITableViewCell {

    @IBOutlet weak var radioImage: UIImageView!
    

    @IBOutlet weak var title: UILabel!
    
    func assign(imageType : String ,titleValue : String){
        radioImage.image =  UIImage(named: imageType)
        title.text =  titleValue
        
    }
}
