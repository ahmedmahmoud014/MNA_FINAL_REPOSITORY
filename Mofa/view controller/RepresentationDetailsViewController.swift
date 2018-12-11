//
//  RepresentationDetailsViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-18.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class RepresentationDetailsViewController: BaseController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var representationDetailsTable: UITableView!
    
    @IBOutlet weak var pageTitle: UIView!
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var representationName: UILabel!
    
    @IBOutlet weak var mapButton: UIButton!
    var allItems = [RepresentationItemDetails]()
    var representation : RepresentationDetails!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        representationDetailsTable.rowHeight = UITableViewAutomaticDimension
        representationDetailsTable.estimatedRowHeight = 100
        
        
        print("call will")
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //
        //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
        let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 10))
        footerView.backgroundColor = UIColor.clear
        
        return footerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return allItems.count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentationDetailsTableViewCell", for: indexPath) as! RepresentationDetailsTableViewCell
        
        let item  = allItems[indexPath.section]
        cell.addValue(itemName:item.itemName, itemImag: item.itemImage, itemValue: item.itemValues, actionImageValue: item.actionImage)
        
        cell.addShadowR(roundBorder: 20, opacity: 0.1)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //tab shap
        tabBarDisActive(type: 1)
        setNavigationBar(shomeHome: true, showBack: true)
        mapButton.addShadow(roundBorder: 4, opacity: 0.2)
         representation = SingletonClass().sharedInstance.representationDetails
        
pageTitle.addShadow(roundBorder: 20, opacity: 0.1)
        countryImage.image = UIImage(named: representation.representationImage)
        representationName.text = representation.representationName
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationPresident", languageType: "ar"), itemImage: "boss",itemValues: (representation?.representationPresident)!, actionImage: ""))
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationAddress", languageType: "ar"),itemImage: "grey_map",itemValues: (representation?.representationAddress)!,actionImage: "ic_map"))
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationPhoneNumber", languageType: "ar"),itemImage: "phone",itemValues: (representation?.representationPhoneNumber)!,actionImage: "ic_phone"))
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationAffairsPhone", languageType: "ar"),itemImage: "phone_blue",itemValues: (representation?.representationAffairsPhone)!,actionImage: "ic_phone"))
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationFax", languageType: "ar"),itemImage: "fax",itemValues: (representation?.representationFax)!,actionImage: ""))
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationEmail", languageType: "ar"),itemImage: "mail",itemValues: (representation?.representationEmail)!,actionImage: "ic_email"))
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationTimeDiffrance", languageType: "ar"),itemImage: "time_difference",itemValues: (representation?.representationTimeDiffrance)!,actionImage: ""))
         allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationVacation", languageType: "ar"),itemImage: "closed",itemValues: (representation?.representationVacation)!,actionImage: ""))
        
        allItems.append(RepresentationItemDetails(itemName: localizedString(forKey: "representationWorkDay", languageType: "ar"),itemImage: "working_hours",itemValues: (representation?.representationWorkDay)!,actionImage: ""))
        
        
        

    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 1) {
            print("caaaaaaaa")
            let coordinate = CLLocationCoordinate2DMake(representation.representationLat, representation.representationLog)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name =  "location"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        }
       else  if (indexPath.section == 2 || indexPath.section == 3) {
            makecallPhone(number: allItems[indexPath.section].itemValues)
            print("calllll va \( allItems[indexPath.section].itemValues )   section \(indexPath.section) ")

            
        }
        else if indexPath.section == 5 {
            sendEmail(email: allItems[indexPath.section].itemValues )
            print("calllll va \( allItems[indexPath.section].itemValues )   section \(indexPath.section) ")

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveToMap(_ sender: UIButton) {
        
        print("caaaaaaaa")
        let coordinate = CLLocationCoordinate2DMake(representation.representationLat, representation.representationLog)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name =  "location"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    func sendEmail(email : String){
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    func makecallPhone(number : String){
//        guard let number = URL(string: "tel://" + number) else { return }
//        UIApplication.shared.open(number)
        print("ccccccccccccc")
        
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
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
