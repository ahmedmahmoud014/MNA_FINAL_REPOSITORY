//
//  UIButtonExtension.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit

extension  UIButton {
    
    func imageInButtonRight(position : UIControlContentHorizontalAlignment , semanticContent :  UISemanticContentAttribute, imageEdgeSet : UIEdgeInsets ) {
       // super.layoutSubviews()
        semanticContentAttribute = semanticContent
        contentHorizontalAlignment = position
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        
        let availableWidth = availableSpace.width - imageEdgeSet.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets =  imageEdgeSet
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: availableWidth / 2)
    }
    
    func imageInButtonRightFixedWidth(position : UIControlContentHorizontalAlignment , semanticContent :  UISemanticContentAttribute, imageEdgeSet : UIEdgeInsets ) {
        // super.layoutSubviews()
        semanticContentAttribute = semanticContent
        contentHorizontalAlignment = position
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        
        let availableWidth = availableSpace.width - imageEdgeSet.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets =  imageEdgeSet
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: availableWidth / 4)
    }
    
    
    func imageInButtonLeft(position : UIControlContentHorizontalAlignment , imageEdgeSet : UIEdgeInsets ) {
        contentHorizontalAlignment = position
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.right - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = imageEdgeSet
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: availableWidth / 2, bottom: 0, right: 0)
    }
    
}
