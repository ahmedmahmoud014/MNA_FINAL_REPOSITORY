//
//  RepresentationHomeTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-17.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class RepresentationHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var representationName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addValue(countryNam : String , countryImag:String )
    {
        countryName.text = countryNam
        countryImage.image =  UIImage(named :  countryImag)
    }
    
    func addValue(countryNam : String , countryImag:String,representationNam:String,  representationDistance:Int )
    {
        countryName.text =   representationNam
        countryImage.image =  UIImage(named :  countryImag)
        representationName.text = countryNam
        
        if representationDistance  != 0
        {
            distance.text = "\(representationDistance) كم"
        }
    }

}
