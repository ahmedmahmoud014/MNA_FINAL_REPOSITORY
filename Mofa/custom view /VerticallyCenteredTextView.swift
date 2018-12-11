//
//  VerticallyCenteredTextView.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
class VerticallyCenteredTextView: UITextView {
    override var contentSize: CGSize {
        didSet {
            var topCorrection = (bounds.size.height - contentSize.height * zoomScale) / 2.0
            topCorrection = max(0, topCorrection)
            contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
        }
    }
    
}
