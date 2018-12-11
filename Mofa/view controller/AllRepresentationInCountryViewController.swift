//
//  AllRepresentationInCountryViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-18.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
import CoreLocation

class AllRepresentationInCountryViewController: BaseController ,UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate {
    var countrySelected : RepresentationStruct!
    
    var loaded =  true
    
    @IBOutlet weak var pageLabelValue: UILabel!
    @IBOutlet weak var pageTitle: UIView!
    let locationManager = CLLocationManager()
    var allPre : SingletonClass!
    @IBOutlet weak var allNearestRepresentationTable: UITableView!
    
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        //
//                //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
//                let footerView = UIView(frame: CGRect(x:0, y: 0, width: 0, height: -60))
//                footerView.backgroundColor = UIColor.clear
//
//                return footerView
//            }
    func numberOfSections(in tableView: UITableView) -> Int {
        if countrySelected != nil {
            return countrySelected.allRepresentation.count
            
        }
        else { return 0 }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllRepresentationHomeTableViewCell", for: indexPath) as! RepresentationHomeTableViewCell
        cell.addValue(countryNam: countrySelected.countryName,countryImag: countrySelected.countryImage,representationNam: countrySelected.allRepresentation[indexPath.section].representationName,representationDistance: countrySelected.allRepresentation[indexPath.section].representationDistance)
        
        cell.addShadowR(roundBorder: 20, opacity: 0.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let representationDetails  =  SingletonClass()
        representationDetails.sharedInstance.representationDetails =  countrySelected.allRepresentation[indexPath.section]
          moveTo(name: "RepresentationDetailsViewController" , backTo: "AllRepresentationInCountryViewController")
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allNearestRepresentationTable.estimatedRowHeight = 200
        allNearestRepresentationTable.rowHeight = UITableViewAutomaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(shomeHome: true, showBack: true)
       
        
        //tab shap
        tabBarDisActive(type: 1)
        allNearestRepresentationTable.delegate = self
        allNearestRepresentationTable.dataSource = self
        // Do any additional setup after loading the view.
        
        pageTitle.addShadow(roundBorder: 20, opacity: 0.1)
        deviceTypeForMarginTop(marginTop: marginTop)
          allPre  = SingletonClass()
        if (allPre.sharedInstance.NearestORSearchCountry == 0)
        {
            countrySelected = allPre.sharedInstance.country
            allNearestRepresentationTable.reloadData()
            
            pageLabelValue.text  =  localizedString(forKey:countrySelected.countryName, languageType: "ar")

            print("location  out ")

        }
 
        
//      else  if  allPre.sharedInstance.NearestORSearchCountry == 1
        
       else {
        // Ask for Authorisation from the User.
            
            pageLabelValue.text  =  localizedString(forKey: "nearestRepresentation", languageType: "ar")

        self.locationManager.requestAlwaysAuthorization()
        

        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization( )
            
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        else{
         
            
            
            let alertController = UIAlertController(title: " ", message: "تفعيل تحديد الموقع  ", preferredStyle: .alert)

            let cancelAction = UIAlertAction(title: NSLocalizedString("إلغاء", comment: ""), style: .cancel, handler: nil)
            let settingsAction = UIAlertAction(title: NSLocalizedString("الإعدادات", comment: ""), style: .default) { (UIAlertAction) in
                UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)! as URL, options: [:], completionHandler: nil)
            }
            alertController.addAction(settingsAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  get location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        if loaded {
            
            loaded = false 
        showLoader(message: "تحميل الأقرب إليك")
            //let reciveData =  SingletonClass()
        if allPre.sharedInstance.NearestORSearchCountry == 1
        {
           
            
            // 24.727538, 46.684995
            let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
            fetchCityAndCountry(from: location) { city, country, error in
                guard let city = city, let country = country, error == nil else { return }
                print(" location" + city + ", " + country)  // Rio de Janeiro, Brazil
                if country != "Saudi Arabia"{
                    self.countrySelected = self.allPre.sharedInstance.sharedInstance.country
                    self.allNearestRepresentationTable.reloadData()
                    print("location  lllll\(locValue.latitude)")
                self.dismissLoader()
                    
                }
                else {
                    self.showAlert(message:self.localizedString(forKey: "invalidLocation", languageType: "ar"), title: "")
                    self.dismissLoader()

                }
            }
            
            
            }
            
        }
        
      
       
            
        
        // print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
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
