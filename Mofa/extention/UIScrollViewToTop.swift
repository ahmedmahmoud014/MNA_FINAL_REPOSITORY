//
//  UIScrollViewToTop.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
    
    func scrollToTop(y : Int ) {
        let desiredOffset = CGPoint(x: 0, y: y)
        setContentOffset(desiredOffset, animated: true)
    }
}
