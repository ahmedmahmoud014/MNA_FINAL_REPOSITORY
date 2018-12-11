//
//  SafeAreaFixTabBar.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-03.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//
import UIKit
class SafeAreaFixTabBar: UITabBar {
    
    
    
    var oldSafeAreaInsets = UIEdgeInsets.zero
    
    @available(iOS 11.0, *)
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        
        if oldSafeAreaInsets != safeAreaInsets {
            oldSafeAreaInsets = safeAreaInsets
            
            invalidateIntrinsicContentSize()
            superview?.setNeedsLayout()
            superview?.layoutSubviews()
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        if #available(iOS 11.0, *) {
            let bottomInset = safeAreaInsets.bottom
            if bottomInset > 0 && size.height < 50 {
                size.height += bottomInset
            }
        }
        return size
    }
}
