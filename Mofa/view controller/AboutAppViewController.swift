//
//  AboutAppViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-03.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
import ObjectMapper

class AboutAppViewController: BaseController {
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    
    @IBOutlet weak var pageTitle: UIView!
    @IBOutlet weak var aboutText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarDisActive(type: 1)

        setNavigationBar(shomeHome: true, showBack: true)
        
        aboutText.font = UIFont.init(name: "HacenAlgeria", size: 20)!
       aboutText.contentInset = UIEdgeInsetsMake(10, 20, 0, 20)
        aboutText.addShadow(roundBorder: 20, opacity: 0.1)

        deviceTypeForMarginTop(marginTop: marginTop)
        pageTitle.addShadow(roundBorder: 20, opacity: 0.2)

        // Do any additional setup after loading the view.
        
        
        // disable tab bar item
        
//        let customTabBarItem:UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ahmed ")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "info"))
//        self.tabBarItem = customTabBarItem
        
        
        //UITabBar.appearance().tintColor = UIColor.red
//
        
        
        
//        
//        let  callAPI   =  CallAPI()
//        
//        callAPI.getData(url:
//            TEST_URL, callBack: {
//                result   in
//                
//                if result.isSuccess {
//                    print("dataaaaaaaaaaaaaaaaa1")
//
//                    guard let json = result.value as? [String: Any] else {
//                                    print("didn't get todo object as JSON from API")
//                                    if let error = result.error {
//                                        print("Error: \(error)")
//                                    }
//                                    return
//                                }
//                                print(json)
//                    
//                    let person = Mapper<Person>().map(JSONObject: result.value)
//                    print((person?.title)!)
//
//                }
//                else {
//                   self.showAlert(message: "server error ", title: "error ")
//                }
//            })
//        
//        
//        // anter  call
//        callAPI.getData(url: CALL_PEOPLE, callBack: {
//            result in
//            if result.isSuccess{
//                print("dataaaaaaaaaaaaaaaaa2")
//                
//                let person = Mapper<TestPeople>().map(JSONObject: result.value)
//               // print("dataaaaaaaaaaaaaaaaa\((person?.films)!)")
//                for urHost in (person?.films)!
//                {
//                    print("dataaaaaaa \t \(urHost)")
//                }
//                
//                
////                guard (result.value as? [String: Any]) != nil else {
////                    print("didn't get todo object as JSON from API")
////                    if let error = result.error {
////                        print("Error: \(error)")
////                    }
////                    return
////                }
////
//                
//                // for convert object to  json
//                let JSONString = Mapper<TestPeople>().toJSON(person!)
//                print("dataaaaaaa \t \(JSONString)")
//
//            }
//            else {
//                self.showAlert(message: "server error ", title: "error ")
//            }
//            
//        })
//        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  CHANGE COLOR OF STATUS BAR
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
