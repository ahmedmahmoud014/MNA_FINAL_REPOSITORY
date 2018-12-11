//
//  FiveStepRegistPassportAndTripDataUIViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class FiveStepRegistPassportAndTripDataUIViewController: BaseController {

    @IBOutlet weak var doneText: UILabel!
    @IBOutlet weak var doneImage: UIImageView!
    @IBOutlet weak var backToHomeStyle: UIButton!
    @IBAction func bacKToHomeAction(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FiveStepRegistPassportAndTripDataUIViewController")
//        dismiss(animated: true, completion: nil)
//        self.show(vc!, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        doneImage.image =  UIImage(named:  SingletonClass().sharedInstance.doneImage)
        doneText.text = SingletonClass().sharedInstance.doneTitle
       // setNavigationBar(shomeHome: false , showBack: true )
        backToHomeStyle.setTitle(localizedString(forKey: "backToHome", languageType: "ar"), for: .normal)
        backToHomeStyle.addShadow(roundBorder: 20, opacity: 0.1)
        backToHomeStyle.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(0, 40 , 0, 0))


    }
}
