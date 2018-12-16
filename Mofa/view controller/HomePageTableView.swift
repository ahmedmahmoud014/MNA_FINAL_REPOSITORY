//
//  HomePageTableView.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
//import MOLH
class HomePageTableView: BaseController ,UITableViewDataSource,UITableViewDelegate{
    
    var homePageTableViewModel : HomePageTableViewModel?
    
    var checkSelected :  Int  =  100
    
    var checkedReload :  Bool = true
    
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let status = allItems[section].status
        
        if (status){
            return allItems[section].items.count}
        else{
            return 0
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    @IBOutlet var homePageTableview: UITableView!
    
    var headerTitle = [MainPageTableHeader]()
    
    
    var allItems =   [ExpandableTableRow]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section].headerName
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
        let button: UIButton = UIButton(frame: CGRect(x:0, y:0, width:tableView.frame.width , height:80))
        button.setImage(UIImage(named: headerTitle[section].imageName), for: .normal)
        button.addTarget(self, action: #selector(expandeCollaps), for: .touchUpInside)
        button.tag =  section
        
        button.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(25,tableView.frame.width-45, 25, 15))
//
       // button.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(25,15, 25, tableView.frame.width-45))
//        button.imageEdgeInsets = UIEdgeInsetsMake(25,tableView.frame.width-45, 25, 15);
//        button.titleEdgeInsets = UIEdgeInsetsMake(0,-90, 0, 60);
        button.titleLabel?.font = UIFont.init(name: "HacenAlgeria", size: 23)!
        button.setTitleColor(UIColor.black, for:.normal )
        button.backgroundColor = UIColor.white
        //button.contentHorizontalAlignment = .right
        button.setTitle(headerTitle[section].headerName, for: .normal)
        headerView.addSubview(button)
        let imageView = UIImageView(image: UIImage(named: headerTitle[section].colaps)!)
        imageView.frame = CGRect(x: 15, y: 25, width: 30, height: 30)
        headerView.addSubview(imageView)
        button.addShadowR(roundBorder: 20,opacity: 0.1)
        
        
        
        return headerView
    }
    
    //open  and close drop menu
    @objc func expandeCollaps(button  : UIButton){
      
        let section = button.tag
        var  indexPath = [IndexPath]();

        // add items to  array


        // check  if section  is opend
        if (checkSelected  ==  section){
            allItems =  (homePageTableViewModel?.assignItemToArray())!
            headerTitle = (homePageTableViewModel?.headerTitle)!
            homePageTableview.reloadData()
            checkedReload =  !checkedReload
            checkSelected  =  100
            self.homePageTableview.contentInset = UIEdgeInsetsMake(80
                , 0, 0, 0)

        }
           // end check


        else{
            for  row in allItems[section].items.indices
            {
                let index = IndexPath(row: row, section: section)
                indexPath.append(index)

            }
            allItems =  (homePageTableViewModel?.assignItemToArray())!
            headerTitle = (homePageTableViewModel?.headerTitle)!

            let status = allItems[section].status
            allItems[section].status = !status
            checkSelected  =  section

            if (status){
                headerTitle[section].colaps = "plus"
                self.homePageTableview.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
                homePageTableview.deleteRows(at: indexPath, with: .fade)
            }
            else {

                //checkedReload =  !checkedReload
                headerTitle[section].colaps = "minus"

                if section != 0
                {
                self.homePageTableview.contentInset = UIEdgeInsetsMake(-80, 0, 0, 0)
                }else {
                    self.homePageTableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
}
               // homePageTableview.insertRows(at: indexPath, with: .fade)


            }
        }
        homePageTableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0{
            return 55
        }
        else{
            return 30

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell", for: indexPath) as! HomePageTableViewCell
        let vlaue = allItems[indexPath.section];
        
        
        if(indexPath.section == 1){
            if(indexPath.row  == 0  )
            {
                cell.addValue(rowdata: "",showView: true , itemIconName: ""  ,separatorColor:0x0091b3)

            }
            else
                if (indexPath.row  == vlaue.items.count-1 ){
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: true,itemIconName: "ic_services",separatorColor: 0x0091b3)
            }
            else {
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: false, itemIconName:"ic_services"  ,separatorColor:0x0091b3)
            }
        }
        else if(indexPath.section == 2){
            // cell.backgroundColor = UIColorFromRGB(rgbValue: 0x37b0c9)
            if(indexPath.row  == 0  ){
                cell.addValue(rowdata: "",showView: true , itemIconName: ""  ,separatorColor:0x0091b3)
                
            }
            else if (indexPath.row  == vlaue.items.count-1 ){
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: true,itemIconName: "ic_instructions",separatorColor: 0x0091b3)
            }
            else {
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: false, itemIconName:"ic_instructions"  ,separatorColor:0x0091b3)
            }
        }
        else if(indexPath.section == 0) {
            //  cell.backgroundColor = UIColorFromRGB(rgbValue: 0x0076a9)
            if(indexPath.row  == 0  ){
                cell.addValue(rowdata: "",showView: true , itemIconName: ""  ,separatorColor:0x0091b3)
                
            }
            else if (indexPath.row  == vlaue.items.count-1 ){
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: true,itemIconName: "icon_info",separatorColor:0x005e86)
            }
            else {
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: false, itemIconName:"icon_info" ,separatorColor:0x005e86 )
            }
            
            
            
        }
        else  {
            //  cell.backgroundColor = UIColorFromRGB(rgbValue: 0x0076a9)
            if(indexPath.row  == 0  ){
                cell.addValue(rowdata: "",showView: true , itemIconName: ""  ,separatorColor:0x0091b3)
                
            }
            else if (indexPath.row  == vlaue.items.count-1 ){
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: true,itemIconName: "ic_about",separatorColor:0x005e86)
            }
            else {
                cell.addValue(rowdata: vlaue.items[indexPath.row],showView: false, itemIconName:"ic_about" ,separatorColor:0x005e86 )
            }
            
            
            
        }
        return cell;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarDisActive(type: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("will desappear ")
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageTableview.addShadow(roundBorder: 20, opacity: 0.0)
        
//        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
//        MOLH.reset(transition: .transitionCrossDissolve)
        
        homePageTableview.dataSource = self;
        homePageTableview.delegate =  self;
        self.homePageTableview.contentInset = UIEdgeInsetsMake(80, 0, 0, 0)
        
        homePageTableViewModel = HomePageTableViewModel()
        headerTitle = (homePageTableViewModel?.headerTitle)!
        
//        tabBarDisActive(type: 0)

        
        // add items to  array
        allItems =  (homePageTableViewModel?.assignItemToArray())!
        
        // device type
        deviceTypeForMarginTop(marginTop: marginTop)
    }
    
    
//        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//    
//            return 50
//    
//        }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
        let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 15))
        footerView.backgroundColor = UIColor.clear
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("u clicked this  \(allItems[indexPath.section].items[indexPath.row])")
        //  moveTo(name: "ShowURlViewController")
        InquerySingleTone().sharedInstance.selectStep =  indexPath.row
        
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.clear
        
        InquerySingleTone().sharedInstance.pageTilte = allItems[indexPath.section].items[indexPath.row]
        switch indexPath.section {
            
            
        case 0:
            
            
            if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6  || indexPath.row == 7 || indexPath.row == 8{
                if(Connectivity.isConnectedToInternet ){

                moveTo(name:"InqueriesFeildViewController" ,backTo: "DashBoardViewController")
                }
                else{
                    showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
                    
                }
            }
//            else   if (indexPath.row == 3){
//                if(Connectivity.isConnectedToInternet ){
//
//                    moveTo(name:"InqueriesFeildViewController" ,backTo: "DashBoardViewController")
//                }
//                else{
//                    showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
//
//                }
//            }
            
            break
        case 1:
            if (indexPath.row == 1){
                moveTo(name: "RegistPassportAndTripDataUIViewController",backTo: "HomePageTableView")
                
            }
            else if (indexPath.row == 2){
                moveTo(name: "RequestHelpForOutSideViewController",backTo: "DashBoardViewController")
            }
            else  if (indexPath.row == 3){
                moveTo(name: "RequestVisaViewController",backTo: "DashBoardViewController")

            }
            else  if (indexPath.row == 4){}
            else {
                
            }
            
            break
        case 2:
            
            let singleTon = SingletonClass()
            
            if (indexPath.row == 1){
                singleTon.sharedInstance.arshataType = 1
                
                moveTo(name: "Traveling_ArshadatViewController",backTo: "DashBoardViewController")
                
                SingletonClass().sharedInstance.arshataTitle = localizedString(forKey: "arashadate_living", languageType: "ar")
            }
            else if (indexPath.row == 2){
                singleTon.sharedInstance.arshataType = 0
                moveTo(name: "Traveling_ArshadatViewController",backTo: "DashBoardViewController")
                SingletonClass().sharedInstance.arshataTitle = localizedString(forKey: "arashadate_travaling", languageType: "ar")
                
                
            }
            else if (indexPath.row == 3)  {
                if(Connectivity.isConnectedToInternet ){
                    moveTo(name: "RepresentationHomeViewController",backTo: "DashBoardViewController")
                    
                }else{
                    showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
                    
                }
                
            }
            
            break
        case 3:
            if (indexPath.row == 1){
                moveTo(name: "AboutAppViewController",backTo: "DashBoardViewController")
            }
            else if (indexPath.row == 2){
                
                displayShareSheet(shareContent: "")
                
                
            }
            else  if (indexPath.row == 3){
                
                
                print("tttttt2")
                
            }
            else  if (indexPath.row == 4){
                moveTo(name: "ImportantLinksViewController",backTo: "DashBoardViewController")
                
            }
            else {
                
            }
            break
            
        default: break
            
        }
        
        
    }
    
    
    // for share  link of app to  anhter  apps
    func displayShareSheet(shareContent:String) {
        if(Connectivity.isConnectedToInternet ){
            let activityViewController = UIActivityViewController(
                activityItems: ["https://itunes.apple.com/us/app/mofa-%D9%88%D8%B2%D8%A7%D8%B1%D8%A9-%D8%A7%D9%84%D8%AE%D8%A7%D8%B1%D8%AC%D9%8A%D8%A9-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9/id590378462?mt=8" as NSString],
                applicationActivities: [])
            present(activityViewController, animated: true, completion: nil)
        }else{
            showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
            
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

