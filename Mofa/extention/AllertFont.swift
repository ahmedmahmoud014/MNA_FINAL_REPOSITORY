//
//  AllertFont.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-09.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
extension UIAlertController {
   
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let font = UIFont.init(name: "HacenAlgeria", size: 20)!
        changeFont(view: self.view, font: font )
        
     
    }
    
    
    func changeFont(view: UIView, font:UIFont) {
        for item in view.subviews {
//            if item.isKind(of: UICollectionView.self) {
//                let col = item as! UICollectionView
//                for  row in col.subviews{
//                    changeFont(view: row, font: font)
//                    row.tintColor =  UIColor.red
//                }
//            }
            if item.isKind(of: UILabel.self) {
                let label = item as! UILabel
                label.font = font
            }else {
                changeFont(view: item, font: font)
            }
            
        }
    }
}
