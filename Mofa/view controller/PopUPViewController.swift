//
//  PopUPViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class PopUPViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    public static var  popUPDelegate : PopUPDelegate!
    public static var  tag : Int!
    public static var  selectedValue : Int!


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingletonClass().sharedInstance.allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopupTableViewCell", for: indexPath) as! PopupTableViewCell
        let item =  SingletonClass().sharedInstance.allItems[indexPath.row]
        
        if indexPath.row != PopUPViewController.selectedValue {
        cell.assign(imageType:item.image , titleValue: item.title)
        }
        else {
            
            cell.assign(imageType:"radio_selected", titleValue: item.title)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PopUPViewController.popUPDelegate.selectedItem(itemValue: indexPath.row,tag:PopUPViewController.tag )
        self.dismiss(animated: true, completion: nil)

    }
    

    @IBOutlet weak var closeTitle: UIButton!
    @IBOutlet weak var popupTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        closeTitle.addShadow(roundBorder: 20, opacity: 0.1)
        popupTableView.addShadowR(roundBorder: 20, opacity: 0.1)

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissPupUp(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
