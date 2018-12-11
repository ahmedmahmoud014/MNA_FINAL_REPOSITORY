//
//  ServiceViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-21.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ServiceViewController: BaseController ,UITableViewDataSource,UITableViewDelegate{
  
   var  homeItem :HomeStruct?
    var serviceItems :[ServiceItem] = []

    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    // MARK: - Table View delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.serviceItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "ServiceTableViewCell"

        // create a new cell if needed or reuse an old one
        let cell = serviceTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ServiceTableViewCell!
        
        // set the text from the data model
        let  homeStruct :ServiceItem = self.serviceItems[indexPath.section]
        cell?.assignValues(serviceName:  homeStruct.serviceName,serviceImage: homeStruct.serviceImageName)
        // add border and color
//        cell?.backgroundColor = UIColor.white
//        cell?.layer.borderColor = UIColor.black.cgColor
//        cell?.layer.borderWidth = 1
//        cell?.layer.cornerRadius = 8
//        cell?.clipsToBounds = true
        
        cell?.addShadow(roundBorder: 4,opacity: 0.1)
        
        return cell!
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")
            // do some tasks..
            MoveToShowUrl( url: serviceItems[indexPath.section].serviceURL)

        }
        else{ showAlert(message:  "there is no internet connection  ", title: "internet connection")}
        
    }

    func  MoveToShowUrl(url : String ){
        addStringToShar(key: "MOVE_TO", value: "ServiceViewController")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "ShowURlViewController") as! ShowURlViewController
        navigationController.url = url;
        self.present(navigationController, animated: true, completion: nil)
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden =  true;
//        self.navigationController?.navigationBar.isTranslucent = true;
        setNavigationBar(shomeHome: true, showBack: true)
        serviceTableView.dataSource = self ;
        serviceTableView.delegate = self;
        serviceItems.removeAll()
        serviceItems  =  (homeItem?.serviceItems)!
         serviceName.text = homeItem?.serviceName
        serviceImage.image = UIImage(named: (homeItem?.serviceImageName)!)
        serviceTableView.reloadData()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    

}
