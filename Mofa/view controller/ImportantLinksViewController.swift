//
//  ImportantLinksViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-04.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ImportantLinksViewController: BaseController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var pageTilteView: UIView!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    @IBOutlet weak var importantLinkTable: UITableView!
    var allLinks = [ImportantLinkStruct]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return    1
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 80
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImportantLinksTableViewCell", for: indexPath) as! ImportantLinksTableViewCell
        if (indexPath.section  == allLinks.count-1 ){
            cell.addValue(rowdata: allLinks[indexPath.section].headerName, link: allLinks[indexPath.section].imageName,showView: true)
        }
        else {
            cell.addValue(rowdata: allLinks[indexPath.section].headerName,link: allLinks[indexPath.section].imageName,showView: false )
        }
        cell.addShadowR(roundBorder: 20,opacity: 0.2)
        return  cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allLinks.count
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        importantLinkTable.delegate = self
        importantLinkTable.dataSource = self
        
        tabBarDisActive(type: 1)
        
        pageTilteView.addShadow(roundBorder: 20, opacity: 0.2)
//        importantLinkTable.backgroundColor = nil
//        importantLinkTable.backgroundColor = UIColor.clear
        allLinks = [
            ImportantLinkStruct(headerName: "http://www.mofa.gov.sa/ServicesAndInformation/news/statements",imageName:"أخبار وتصريحات القادة")
            ,ImportantLinkStruct(headerName: "http://www.mofa.gov.sa/ServicesAndInformation/news/GovernmentNews",imageName: "أخبار الحكومة")
            ,ImportantLinkStruct(headerName: "http://www.mofa.gov.sa/servicesandinformation/news/MinistryNews",imageName: "أخبار الوزارة")
            ,ImportantLinkStruct(headerName: "http://www.mofa.gov.sa/ServicesAndInformation/Letters",imageName: "خطابات المملكة في المحافل الدولية")
             ,ImportantLinkStruct(headerName: "http://www.mofa.gov.sa/ServicesAndInformation/LeadershipStatements/TwoHolyMosquesSpeeches",imageName:"الكلمات الرسمية لخادم الحرمين الشريفين"),
        ]
        setNavigationBar(shomeHome:true, showBack: true)

        
        // device type validation
        deviceTypeForMarginTop(marginTop: marginTop)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = NSURL(string: allLinks[indexPath.section].headerName)!
        print("selected url \(url)")
        
        if(Connectivity.isConnectedToInternet ){
        UIApplication.shared.openURL(url as URL)
        }else{
            showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
  //  https://www.accuweather.com/ar/sa/saudi-arabia-weather
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
