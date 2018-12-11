//
//  ShowURlViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-22.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ShowURlViewController: BaseController {
    
    var url: String!

    @IBOutlet weak var marginTop: NSLayoutConstraint!
    @IBOutlet weak var webView: UIWebView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(shomeHome :true , showBack: true)
        let url = URL (string: "https://www.google.com.eg/")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                print("iPhone X")
           marginTop.constant = 75
            default:
                marginTop .constant = 91

            }
        }
    }
    
    //  CHANGE COLOR OF STATUS BAR
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
