//
//  NearestRepresentationUsingLocationViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-17.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit



class NearestRepresentationUsingLocationViewController: BaseController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{
    
    
   static var showAllRepresentationInCountry : Int!
    @IBOutlet weak var searchCountry: DesignableUITextField!
    @IBOutlet weak var allCountryTableView: UITableView!
    
    @IBOutlet weak var searchTextHeight: NSLayoutConstraint!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    var allCountry = [RepresentationStruct]()
    var afterSearch = [RepresentationStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tab shap
        tabBarDisActive(type: 1)
        deviceTypeForMarginTop(marginTop: marginTop)
        setNavigationBar(shomeHome: true, showBack: true)
        searchCountry.attributedPlaceholder  = NSAttributedString(string: "بحث في القائمة ...",attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0x818181)])
        searchCountry.addShadow(roundBorder: 20, opacity: 0.2)
        
        
        let nearOrSearchCountry =  SingletonClass().sharedInstance.NearestORSearchCountry
        
        
        if (nearOrSearchCountry ==  0 ){
            
            allCountry = [
                    RepresentationStruct(countryName: "استراليا", countryImage: "australia", allRepresentation: [RepresentationDetails(representationName:  "سفارة المملكة العربية السعودية فى استراليا (كانبيرا)", representationImage: "australia", representationPresident: "نبيل بن محمد آل صالح", representationAddress:  "38 Guilfoyle Street Yarralumla ACT 2600 Canberra, Australia", representationPhoneNumber: "0061432257277", representationAffairsPhone: "00966920033334", representationFax: "61262828911", representationEmail: "auemb@mofa.gov.sa", representationTimeDiffrance: "(+8 ساعات) شتاء , (+7 ساعات) صيفا عن توقيت المملكة", representationWorkDay: "9 صباحا – 3 مساءا", representationVacation: "السبت والأحد", representationLat: 149.129647, representationLog: -35.281720 , representationDistance: 0)]),
                   
                   RepresentationStruct(countryName: "البرازيل", countryImage: "brazil", allRepresentation: [RepresentationDetails(representationName: "سفارة المملكة العربية السعودية فى البرازيل (برازيليا)", representationImage: "brazil", representationPresident: "هشام بن سلطان ال ظافر القحطاني – سفير خادم الحرمين الشريفين في برازيليا", representationAddress: "EEMBASSY OF THE KINDOM OF SAUDI ARABIA SHIS QI 09 – CONJUNTO 9 – CASA 18 – LAGO SUL BRASILIA DF – BRAZIL CEP: 70625-090- BRASILIA DF – BRAZIL", representationPhoneNumber: "00556132481377", representationAffairsPhone: "00556132482327", representationFax: "556132481142", representationEmail: "bremb@mofa.gov.sa", representationTimeDiffrance: "( -5 ) بالتوقيت الشتوي ، ( -6 ) بالتوقيت الصيفي", representationWorkDay: "من (9) التاسعة صباحا إلى (4) الرابعة مساءا", representationVacation: " السبت والاحد", representationLat: 149.129647, representationLog: -35.281720, representationDistance: 0)]),
                   
                   RepresentationStruct(countryName: "مصر", countryImage: "egypt", allRepresentation: [RepresentationDetails(representationName: "سفارة المملكة العربية السعودية في مصر(القاهرة )", representationImage: "egypt", representationPresident: "معالي أحمد قطان – سفير خادم الحرمين الشريفين في القاهرة", representationAddress: "شارع اليمن – الجيزة – أمام مديرية أمن الجيزة", representationPhoneNumber: "2034977590", representationAffairsPhone: "2034977590", representationFax: "20233366986", representationEmail: "egemb@mofa.gov.sa", representationTimeDiffrance: " (- 1) ساعة شتاء عن توقيت المملكة", representationWorkDay: " من 9 صباحا – 4 مساءا", representationVacation: " الجمعة – السبت", representationLat: 149.129647, representationLog: -35.281720, representationDistance: 0)]),
                   
                   RepresentationStruct(countryName: "فرنسا", countryImage: "france", allRepresentation: [RepresentationDetails(representationName: "سفارة المملكة العربية السعودية في فرنسا( باريس )", representationImage: "france", representationPresident: "سعادة الدكتور علي بن محمد القرني- القائم بالأعمال", representationAddress:  "5 أفينو هوش – باريس الدائرة الثامنة – 75008", representationPhoneNumber: "2034977590", representationAffairsPhone: "2034977590", representationFax: "33156794001", representationEmail: "fremb@mofa.gov.sa", representationTimeDiffrance: "(-2 ساعة) شتاء (-1 ساعة) صيفا عن توقيت المملكة", representationWorkDay: " 9 صباحا – 4 بعد الظهر", representationVacation: " السبت والأحد", representationLat: 149.129647, representationLog: -35.281720, representationDistance: 0)]),
                   
                   RepresentationStruct(countryName: "الاردن", countryImage: "jordan", allRepresentation: [RepresentationDetails(representationName: "سفارة المملكة العربية السعودية فى الاردن ( عمان)", representationImage: "jordan", representationPresident: "سامي بن عبدالله الصالح – سفير خادم الحرمين الشريفين لدى عمان وسفير غير مقيم لدى بغداد", representationAddress: "منطقة عبدون – شارع الامير هاشم بن الحسين – مقابل مجمع تاج مول التجاري", representationPhoneNumber: "0776049814", representationAffairsPhone: "0777049254", representationFax: "96265921154", representationEmail: "joemb@mofa.gov.sa", representationTimeDiffrance: "(- 1) ساعة عن توقيت المملكة", representationWorkDay: "من 8 صباحا – 3 ظهرا", representationVacation: "الجمعة – السبت", representationLat: 149.129647, representationLog: -35.281720, representationDistance: 0)])
            ]
            
        }
        
        else {
//            searchTextHeight .constant =  0
//            searchCountry.isHidden = true
//            allCountry.append(RepresentationStruct(countryName: "bbb",countryImage: "idea",allRepresentation: [RepresentationDetails(representationName: "testee",representationImage: "info", representationPresident: "",representationAddress: "rrrrrrrr", representationPhoneNumber: "04444", representationAffairsPhone: "012121212", representationFax: "",representationEmail: "eeee@s.com", representationTimeDiffrance: "", representationWorkDay: "", representationVacation: "", representationLat:30.031699 , representationLog: 31.21851, representationDistance: 23)]))
//
//            allCountry.append(RepresentationStruct(countryName: "bbb",countryImage: "idea",allRepresentation: [RepresentationDetails(representationName: "testee",representationImage: "info", representationPresident: "",representationAddress: "rrrrrrrr", representationPhoneNumber: "04444", representationAffairsPhone: "012121212", representationFax: "",representationEmail: "eeee@s.com", representationTimeDiffrance: "", representationWorkDay: "", representationVacation: "", representationLat:30.031699 , representationLog: 31.21851, representationDistance: 55)]))
//
//            allCountry.append(RepresentationStruct(countryName: "bbb",countryImage: "idea",allRepresentation: [RepresentationDetails(representationName: "testee",representationImage: "info", representationPresident: "",representationAddress: "rrrrrrrr", representationPhoneNumber: "04444", representationAffairsPhone: "012121212", representationFax: "",representationEmail: "eeee@s.com", representationTimeDiffrance: "", representationWorkDay: "", representationVacation: "", representationLat:52.516227 , representationLog: 13.348292, representationDistance: 12)]))
 }
//
        
        // auto complete
        searchCountry.delegate = self
//
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if afterSearch.count == 0 {
            if searchCountry.text?.count == 0{
            return allCountry.count
            }
            else {
                return 0
            }
            
        }
        else {
            return afterSearch.count
            
        }
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
   
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//        //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
//        let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 0))
//        footerView.backgroundColor = UIColor.clear
//
//        return footerView
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentationHomeTableViewCell", for: indexPath) as! RepresentationHomeTableViewCell
        if afterSearch.count == 0{
        cell.addValue(countryNam: allCountry[indexPath.section].countryName,countryImag: allCountry[indexPath.section].countryImage)
        }else {
            cell.addValue(countryNam: afterSearch[indexPath.section].countryName,countryImag: afterSearch[indexPath.section].countryImage)
        }
        cell.addShadowR(roundBorder: 20, opacity: 0.2)
        
        return cell
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if afterSearch.count == 0 {
            selectAction(index: indexPath.section, items: allCountry)
            

        }else {
            selectAction(index: indexPath.section, items: afterSearch)

        }
        
        
    }
    
    func selectAction(index : Int , items :[RepresentationStruct] ){
        
        let moveData =  SingletonClass( )
        moveData.sharedInstance.country = items[index]
        print("countRe \(moveData.sharedInstance.sharedInstance.country.allRepresentation.count) ")
        if moveData.sharedInstance.sharedInstance.country.allRepresentation.count > 1 {
            moveTo(name: "AllRepresentationInCountryViewController", backTo: "NearestRepresentationUsingLocationViewController")
        }
        else {
            moveData.sharedInstance.representationDetails = items[index].allRepresentation[0]
            moveTo(name: "RepresentationDetailsViewController", backTo: "NearestRepresentationUsingLocationViewController")
        }
    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("text cleared")
        //do few custom activities here
        afterSearch.removeAll()
        searchCountry.text = ""
        allCountryTableView.reloadData()

        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        allCountryTableView!.isHidden = false
        let substring = (self.searchCountry.text! as NSString).replacingCharacters(in: range, with: string)
        
        
        afterSearch.removeAll()
        searchAutocompleteEntriesWithSubstring(substring: substring)
        print("banana \(substring.count)")
        
        
       
        if (substring.isEmpty){
            afterSearch.removeAll()
            allCountryTableView.reloadData()
        }
        if substring.count ==  0 {
            searchCountry.text?.removeAll()
            allCountryTableView.reloadData()

        }

        return true
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        
       // var studentExists: Bool = false
       // autocompleteUrls.removeAll(keepCapacity: false)
        
        print(substring)
        
        for curString in allCountry
        {
            //println(curString)
            //let myString: NSString! = curString.countryName as NSString
          //  let substringRange: NSRange! = myString.range(of: substring)
            
            if curString.countryName.contains(searchCountry.text!){
               // print(curString)
                //allCountryTableView.isHidden =  false
                afterSearch.append(curString)

            }
            
            else {
                
            
            }
//
            
            
//            if (substringRange.location == 0)
//            {
////                afterSearch.removeAll()
//
////
////                for stdnt in self.afterSearch {
////                    if stdnt.countryName == curString.countryName {
////                      // afterSearch.removeAll()
////                        studentExists = true
////                        break
////                    }
////                    else {
////                        studentExists = false
////
////                    }
////
////                }
////
////                if !studentExists {
////                    afterSearch.append(curString)
////                }
//
//                afterSearch.append(curString)
//            }
        }
        
        allCountryTableView!.reloadData()

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
