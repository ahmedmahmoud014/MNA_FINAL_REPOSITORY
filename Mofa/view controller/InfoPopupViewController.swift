//
//  InfoPopupViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-02.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class InfoPopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemView.addShadow(roundBorder: 20, opacity: 0.1)
        close.addShadow(roundBorder: 20, opacity: 0.1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var itemView: UIView!
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
