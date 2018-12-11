//
//  LeftAlignedIconButton.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class LeftAlignedIconButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        contentHorizontalAlignment = .left
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.right - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsetsMake(21, availableWidth / 4 , 21, availableWidth / 8);
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: availableWidth / 2, bottom: 0, right: 0)
    }

}
