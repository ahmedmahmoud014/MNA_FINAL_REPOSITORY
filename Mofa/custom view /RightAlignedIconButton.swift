//
//  RightAlignedIconButton.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import  UIKit
@IBDesignable
class RightAlignedIconButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        semanticContentAttribute = .forceRightToLeft
        contentHorizontalAlignment = .right
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        self.imageView?.contentMode = .scaleAspectFit
      //  self.imageEdgeInsets = UIEdgeInsetsMake(21, availableWidth / 8 , 21, availableWidth / 4);
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: availableWidth / 2)
    }
}
