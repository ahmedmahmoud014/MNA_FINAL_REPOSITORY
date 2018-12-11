//
//  DashBoardViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-03.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
import MOLH

class DashBoardViewController: UITabBarController{
    var tabBarItem1: UITabBarItem = UITabBarItem()
    var tabBarItem2: UITabBarItem = UITabBarItem()
    override func viewDidLoad() {
                super.viewDidLoad()
        
        
        
        
        
      //  self.navigationController?.isNavigationBarHidden = true

        print("caallllllllll")
        
        if  let arrayOfTabBarItems = self.tabBar.items as AnyObject as? NSArray,let tabBarItem = arrayOfTabBarItems[3] as? UITabBarItem {
            tabBarItem.isEnabled = false
            tabBarItem.title = localizedString(forKey: "home_main_profile", languageType: "ar")
        }
        if  let arrayOfTabBarItems = self.tabBar.items as AnyObject as? NSArray,let tabBarItem = arrayOfTabBarItems[2] as? UITabBarItem {
            tabBarItem.isEnabled = false
            tabBarItem.title = localizedString(forKey: "home_main_fav", languageType: "ar")
        }
        if  let arrayOfTabBarItems = self.tabBar.items as AnyObject as? NSArray,let tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem {
            tabBarItem.isEnabled = false
            tabBarItem.title = localizedString(forKey: "home_main_setting", languageType: "ar")
        }
        if  let arrayOfTabBarItems = self.tabBar.items as AnyObject as? NSArray,let tabBarItem = arrayOfTabBarItems[0] as? UITabBarItem {
            tabBarItem.title = localizedString(forKey: "home_main_home", languageType: "ar")

        }
        
       
        
         //  back Ground Color 
//        let image =  UIImage(named : "tab_bg_f")
//        tabBar.clipsToBounds = true
//        self.tabBar.selectionIndicatorImage = image?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: -1))

        

                // Do any additional setup after loading the view.
            }
    
    
    func localizedString(forKey key: String ,languageType:  String ) -> String {
        let path = Bundle.main.path(forResource: languageType , ofType: "lproj")
        let bundal  =  Bundle.init(path: path!)! as Bundle
        let result =  bundal.localizedString(forKey: key, value: nil, table: nil)
        return result
    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarItem1.isEnabled = false
        tabBarItem2.isEnabled = false
    }
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                
                // Dispose of any resources that can be recreated.
            }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11, *) {
            self.tabBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
            self.tabBar.invalidateIntrinsicContentSize()
        }
    }
    
    
//    let numberOfTabs: CGFloat = 4
//    let tabBarHeight: CGFloat = 60
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        updateSelectionIndicatorImage()
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        updateSelectionIndicatorImage()
//    }
//
//    func updateSelectionIndicatorImage() {
//        let width = tabBar.bounds.width
//        var selectionImage = UIImage(named:"tab_b")
//        let tabSize = CGSize(width: width/numberOfTabs, height: tabBarHeight)
//
//        UIGraphicsBeginImageContext(tabSize)
//        selectionImage?.draw(in: CGRect(x: 0, y: 0, width: tabSize.width, height: tabSize.height))
//        selectionImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        tabBar.selectionIndicatorImage = selectionImage
//    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    


