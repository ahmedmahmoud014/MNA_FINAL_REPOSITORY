//
//  RepresentationHomeViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-17.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class RepresentationHomeViewController: BaseController {

    @IBOutlet weak var nearRepresentationView: UIView!
    @IBOutlet weak var nearRepresnentationLabel: UIButton!
    @IBOutlet weak var nearSearchRepresentationLabel: UIButton!
    var nearOrSearchCountry = SingletonClass()
    
    @IBOutlet weak var nearRepresentationSearch: UIView!
    @IBOutlet weak var pageTitle: UIView!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    @IBAction func nearRepresnentationAction(_ sender: UIButton) {
        nearOrSearchCountry.sharedInstance.NearestORSearchCountry = 1
        
        moveTo(name: "AllRepresentationInCountryViewController",backTo: "RepresentationHomeViewController")
        SingletonClass().sharedInstance.country =   RepresentationStruct(countryName: "مصر", countryImage: "egypt", allRepresentation: [RepresentationDetails(representationName: "سفارة المملكة العربية السعودية في مصر(القاهرة )", representationImage: "egypt", representationPresident: "معالي أحمد قطان – سفير خادم الحرمين الشريفين في القاهرة", representationAddress: "شارع اليمن – الجيزة – أمام مديرية أمن الجيزة", representationPhoneNumber: "2034977590", representationAffairsPhone: "2034977590", representationFax: "20233366986", representationEmail: "egemb@mofa.gov.sa", representationTimeDiffrance: " (- 1) ساعة شتاء عن توقيت المملكة", representationWorkDay: " من 9 صباحا – 4 مساءا", representationVacation: " الجمعة – السبت", representationLat: 149.129647, representationLog: -35.281720, representationDistance: 0)])
    }
    
   
    @IBAction func nearSearchRepresentationAction(_ sender: UIButton) {
        nearOrSearchCountry.sharedInstance.NearestORSearchCountry = 0
           moveTo(name: "NearestRepresentationUsingLocationViewController",backTo: "RepresentationHomeViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tab shap
        tabBarDisActive(type: 1)
        // navigation bar
        setNavigationBar(shomeHome: true, showBack:true)
        // button  shap
    nearRepresentationView.addShadow(roundBorder: 20, opacity: 0.2)
 nearRepresentationSearch.addShadow(roundBorder: 20, opacity: 0.2)
        
//      nearRepresnentationLabel.imageView?.contentMode = .scaleAspectFit
//        nearSearchRepresentationLabel.imageView?.contentMode = .scaleAspectFit

        deviceTypeForMarginTop(marginTop: marginTop)
        pageTitle.addShadow(roundBorder: 20, opacity: 0.2)

        // Do any additional setup after loading the view.
        
        
        nearRepresnentationLabel.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(5, 5 , 5, -3))
        
        print(" nnnnnnnnn\(nearRepresnentationLabel.bounds.width / 12)")
        
        nearSearchRepresentationLabel.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(5, 5 , 5, 0))
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
