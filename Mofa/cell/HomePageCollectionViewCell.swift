//
//  HomePageCellCollectionViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-21.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceName: UILabel!
    
    func assignValues(serviceName :String! ,serviceImage : String! ) {
        self.serviceImage.image = UIImage(named : serviceImage)
        self.serviceName.text = serviceName!
    }
}
