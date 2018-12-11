//
//  InqueriesTopDataViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-29.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class InqueriesTopDataViewController: BaseController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var visaBtn: UIButton!
    @IBOutlet weak var noDate: UILabel!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pageTitleValueLbl: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pageTitle: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var allDataTableView: UITableView!
    
    public static var allData  = [InqueryItems]();
    public static var showTopView : Int!;
    public static var pageTitleText  = "";


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return  1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return InqueriesTopDataViewController.allData.count
    }
    
  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return MainInqueriesViewModel().selectCellForSection(tableView:tableView,indexPath:indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //
        //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
        let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 10))
       
        footerView.backgroundColor = UIColor.clear

        
//        if section  ==  0  {
//        footerView.backgroundColor = UIColor.clear
//        }
//        else {
//            footerView.backgroundColor = UIColor.clear
//        }
//

        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return MainInqueriesViewModel().checkFooterHeight(section: section,showPage: InqueriesTopDataViewController.showTopView)
    
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        allDataTableView
            .addShadowR(roundBorder: 20, opacity: 0.1)
        if InqueriesTopDataViewController.pageTitleText.isEmpty {
         pageTitleValueLbl.text = InquerySingleTone().sharedInstance.pageTilte
        }else {
             pageTitleValueLbl.text   = InqueriesTopDataViewController.pageTitleText
        }
        pageTitle.addShadowR(roundBorder: 20, opacity: 0.1)
        deviceTypeForMarginTop(marginTop: topConstraint)
        setNavigationBar(shomeHome: true, showBack: true)
        tabBarDisActive(type: 1)

        
        
        if InqueriesTopDataViewController.allData.count ==  0  {
            noDate.isHidden   = false
            allDataTableView.isHidden = true
        }else {
            noDate.isHidden   = true
            allDataTableView.isHidden = false
            
            if (InqueriesTopDataViewController.allData.count  == 9){
                tableHeight.constant += CGFloat(InqueriesTopDataViewController.allData.count * 30)
                if InqueriesTopDataViewController.allData[8].value! ==  "لا  يوجد طلب "
                {
                    visaBtn.isHidden  =  false
                    visaBtn.addShadow(roundBorder: 20, opacity: 0.1)
                }
            }else {
                tableHeight.constant += CGFloat(InqueriesTopDataViewController.allData.count * 55)

            }
          
        }
   
        
       

    }
    
    @IBAction func makeVisaActionBtn(_ sender: UIButton) {
          moveTo(name: "RequestVisaViewController",backTo: "DashBoardViewController")
    }
  

}
