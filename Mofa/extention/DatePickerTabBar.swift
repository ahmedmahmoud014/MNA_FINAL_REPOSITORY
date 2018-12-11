//
//  DatePickerTabBar.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector,cancelSelector : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        toolBar.backgroundColor = UIColor.red
        toolBar.barTintColor = UIColorFromRGB(rgbValue: 0x033826)

        
       // 033826
    
        let doneButton = UIBarButtonItem(title: "تم", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        addFontType(button: doneButton)
          let cancelButton = UIBarButtonItem(title: "إلغاء", style: UIBarButtonItemStyle.plain, target: self, action: cancelSelector)
        addFontType(button: cancelButton)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func addFontType(button  : UIBarButtonItem){
        
        let colorNormal : UIColor = UIColor.white
        let titleFontAll : UIFont =  UIFont.init(name: "HacenAlgeria", size: 20)!
        let attributesNormal = [
            NSAttributedStringKey.foregroundColor : colorNormal,
            NSAttributedStringKey.font : titleFontAll]
        button.setTitleTextAttributes(attributesNormal, for: [])
    }
    
}
