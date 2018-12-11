//
//  ViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-21.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomeViewController: BaseController ,UICollectionViewDataSource ,UICollectionViewDelegate{
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var moveServiceDataDelegate : MoveServiceDataDelegate?
    var homeItems :[HomeStruct] = []
    var serviceItems :[ServiceItem] = []
    var alimo : AlimofireCallServer?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        assignDataToArray()
        return homeItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "HomePageCollectionViewCell"
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! HomePageCollectionViewCell
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        let  homeStruct :HomeStruct = self.homeItems[indexPath.item]
        cell.assignValues(serviceName:  homeStruct.serviceName,serviceImage: homeStruct.serviceImageName)
        return cell
    }
    
   func  assignDataToArray(){
    homeItems.removeAll()
    serviceItems.removeAll()
    
    homeItems.append(HomeStruct(serviceName: localizedString(forKey: "share_main_page", languageType: "ar"),serviceImageName: "moshrkat",serviceItems:[]))
    homeItems.append(HomeStruct(serviceName: localizedString(forKey: "information_main_page", languageType: "ar"),serviceImageName: "information",serviceItems:[]))
    homeItems.append(HomeStruct(serviceName: localizedString(forKey: "sevices_main_page", languageType: "ar"),serviceImageName: "services",serviceItems:[]))
    homeItems.append(HomeStruct(serviceName: localizedString(forKey: "gide_main_page", languageType: "ar"),serviceImageName: "ershadat",serviceItems:[]))
     homeItems.append(HomeStruct(serviceName:localizedString(forKey: "nearst_main_page", languageType: "ar"),serviceImageName: "momthlia",serviceItems:[]))
    homeItems.append(HomeStruct(serviceName: localizedString(forKey: "favourite_main_page", languageType: "ar"),serviceImageName: "fav",serviceItems:[]))
    
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       // ServiceViewController().index = indexPath.row
        //moveTo(name: "ServiceViewController")
        serviceItems.removeAll()

        switch indexPath.row {
            
        case 0:
            let serName =  homeItems[indexPath.item ].serviceName
            let serImage =  homeItems[indexPath.item] .serviceImageName
            serviceItems.append(ServiceItem( serviceName: localizedString(forKey: "share_openion", languageType: "ar"),serviceImageName: "opinion",serviceURL: "https://www.google.com.eg/"))
            serviceItems.append(ServiceItem( serviceName: localizedString(forKey: "share_idea", languageType: "ar"),serviceImageName: "ideaX",serviceURL: "https://www.youtube.com"))
            serviceItems.append(ServiceItem( serviceName: localizedString(forKey: "share_vote", languageType: "ar"),serviceImageName: "vote",serviceURL: "https://www.google.com.eg/"))
            serviceItems.append(ServiceItem( serviceName: localizedString(forKey: "share_servay", languageType: "ar"),serviceImageName: "astbyan",serviceURL: "https://www.google.com.eg/"))
            serviceItems.append(ServiceItem( serviceName: localizedString(forKey: "share_social_services", languageType: "ar"),serviceImageName: "commuincation_services",serviceURL: "https://www.google.com.eg/"))
            let  homeItem = HomeStruct(serviceName: serName,serviceImageName: serImage,serviceItems:serviceItems)
            MoveToServicePage(homeItem: homeItem)
            break
         case 1:
//            let serName =  homeItems[indexPath.item ].serviceName
//            let serImage =  homeItems[indexPath.item] .serviceImageName
//            serviceItems.append(ServiceItem( serviceName: "service1",serviceImageName: "user",serviceURL: "https://www.google.com.eg/"))
//            serviceItems.append(ServiceItem( serviceName: "service2",serviceImageName: "user",serviceURL: "https://www.youtube.com"))
//            serviceItems.append(ServiceItem( serviceName: "service3",serviceImageName: "user",serviceURL: "https://www.google.com.eg/"))
//            serviceItems.append(ServiceItem( serviceName: "service4",serviceImageName: "user",serviceURL: "https://www.google.com.eg/"))
//            serviceItems.append(ServiceItem( serviceName: "service5",serviceImageName: "user",serviceURL: "https://www.google.com.eg/"))
//            let  homeItem = HomeStruct(serviceName: serName,serviceImageName: serImage,serviceItems:serviceItems)
//            MoveToServicePage(homeItem: homeItem)
            
           // showAlert(message: "", title: "")
            
            break
        case 2:break
        case 3:break
        case 4:break
        default: break

        }
    }
    
    func  MoveToServicePage(homeItem :HomeStruct){
        addStringToShar(key: "MOVE_TO", value: "HomeViewController")
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationController = storyboard.instantiateViewController(withIdentifier: "ServiceViewController") as! ServiceViewController
    navigationController.homeItem = homeItem;
    self.present(navigationController, animated: true, completion: nil)
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
     //   setTabIcons()
        
//        self.navigationController?.navigationBar.isHidden =  true;
//        self.navigationController?.navigationBar.isTranslucent = true;
        // Do any additional setup after loading the view, typically from a nib.
        homeCollectionView.dataSource = self;
        homeCollectionView.delegate = self;

        // rounded corner
        homeCollectionView.addShadow(roundBorder: 8,opacity: 0.5)
        
        // collection view alligenment 
        homeCollectionView.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft

        
        // add back  ground to  collection  view
        
//       homeCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: "test_back")!)
//        homeCollectionView.contentMode = .scaleToFill
//        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
       
        
 
        

    }
//    func callBack(moveServiceDataDelegate : MoveServiceDataDelegate , index : Int?) {
//        print ("call index \(index)")
//        let  homeItem = HomeStruct(serviceName: "serName",serviceImageName: "serImage",serviceItems:[])
//        moveServiceDataDelegate.moveDataFromMainToService(servicesItems: homeItem)
//
//    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



