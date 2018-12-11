//
//  FirstStepRegistPassportAndTripDataUIViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class FirstStepRegistPassportAndTripDataUIViewController: BaseController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        pageView.addShadow(roundBorder: 20, opacity: 0.1)
       textView.font = UIFont.init(name: "HacenAlgeria", size: 20)!
       textView.contentInset = UIEdgeInsetsMake(5, 0, 0, 5)
//        textView.contentInset = UIEdgeInsetsMake(10, 20, 0, 20)
        // Do any additional setup after loading the view.
    }

  
}
