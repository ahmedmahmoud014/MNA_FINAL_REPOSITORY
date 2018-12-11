//
//  TableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-21.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceName: UILabel!
    
    func assignValues(serviceName :String! ,serviceImage : String! ) {
        self.serviceImage.image = UIImage(named : serviceImage)
        self.serviceName.text = serviceName!
    }

}
