//
//  LabelExtentions.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-09-20.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
