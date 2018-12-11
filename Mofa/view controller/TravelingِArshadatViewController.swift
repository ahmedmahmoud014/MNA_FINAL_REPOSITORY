//
//  TravelingِArshadatViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-15.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
import MOLH

class Traveling_ArshadatViewController:
BaseController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var pageTitle: UIView!
    var singleTon :SingletonClass!
    @IBOutlet weak var travillingViewHeigth: NSLayoutConstraint!
    @IBOutlet weak var travllingView: UIView!
    @IBOutlet weak var arshataTableView: UITableView!
    @IBOutlet weak var pageTilte: UILabel!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    var lastContentOffset: CGFloat = 0
    var allItems :[InstructionsModel]!
    
    var instructionVm  =  Traveling_ArshadatVM()
    @IBAction func beforeTravallingAction(_ sender: Any) {
          assignDataToTable(type: 1)
        arshataTableView.reloadData()
        beforeTravallingLabel.isEnabled = true
        
        // custom   tap
        instructionVm.prepareBtnAfterClick(activeBtn: duringTravallingLabel,disActiveBtn: beforeTravallingLabel,activeImage: "while_disabled1",disActiveImage: "before_active1",activeTextColor: 0x107251, disActiveTextColor: 0x8a8b8b )
                scrollToFirstRow()
    }
    @IBAction func duringTravallingAction(_ sender: Any) {
        
      assignDataToTable(type: 2)
        arshataTableView.reloadData()
        // custom   tap
       instructionVm.prepareBtnAfterClick(activeBtn: duringTravallingLabel,disActiveBtn: beforeTravallingLabel,activeImage: "while_active1",disActiveImage: "before_disabled1", activeTextColor: 0x8a8b8b,disActiveTextColor: 0x107251)
        // move to  top of scrollview
        scrollToFirstRow()

        

    }
    
    
    
    
    func scrollToFirstRow() {
        if instructionVm.instractionCount() !=   0 {
        arshataTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
}
    @IBOutlet weak var duringTravallingLabel: UIButton!
    @IBOutlet weak var beforeTravallingLabel: UIButton!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return   1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//
        let cell = tableView.dequeueReusableCell(withIdentifier: "Traveling_ArshadatTableViewCellAdvice", for: indexPath) as! Traveling_ArshadatTableViewCell
        if instructionVm.instractionCount() != 0  {
        let item  = instructionVm.getItemOfInstruactions(index: indexPath.section)
        cell.addValues(tilteValue:item.titleValue!, value: item.instructionValue!)
        cell.addShadowR(roundBorder: 20,opacity: 0.1)
        }
        return cell

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return instructionVm.instractionCount()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
      //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
        let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 10))
        footerView.backgroundColor = UIColor.clear
        
        return footerView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       setNavigationBar(shomeHome: true , showBack: true )
        
        //margin top
        deviceTypeForMarginTop(marginTop: marginTop)
        //tab shap
        tabBarDisActive(type: 1)

        pageTilte.text = SingletonClass().sharedInstance.arshataTitle

            
            //NSLocalizedString("rest", comment: "Localize me Label in the main scene")

            
            
            //SingletonClass().sharedInstance.arshataTitle
        // text to  tab
        prepareTab(button: duringTravallingLabel, buttonTitle:"while_trivaling")
        prepareTab(button: beforeTravallingLabel, buttonTitle:"before_travling")
         
        //shard data
        singleTon = SingletonClass()
        travllingView.addShadow(roundBorder: 20, opacity: 0.1)
         pageTitle.addShadow(roundBorder: 20, opacity: 0.1)
        
        
        if (singleTon.sharedInstance.arshataType == 0){
    
            imageAlignmentINButton(button: beforeTravallingLabel)
            imageAlignmentINButton(button: duringTravallingLabel)
            assignDataToTable(type: 1)
            
        }
        else {
           travllingView.isHidden  = true
            travillingViewHeigth.constant = 0 
           assignDataToTable(type: 3)
        }
    }
    
    
//    func assignDataToTable (type : Int )  {
//
//        switch type {
//        case 1:
//              allItems =  instructionVm.loadAllInstructions(type: 1)
//            break
//        case 2:
//           allItems =  instructionVm.loadAllInstructions(type: 2)
//            break
//        case 3:
//           allItems =  instructionVm.loadAllInstructions(type: 3)
//            break
//        default:
//            break
//        }
//
//
//    }
    
    
    func assignDataToTable (type : Int )  {

       // showLoader(message: "loading Data")
        switch type {
        case 1:

            instructionVm.loadAllInstructions(type: 1, instructionData: {
                allInstructions in
                self.refreshTableAfterLoadData(data: allInstructions)
            }
            )
            break
        case 2:

            instructionVm.loadAllInstructions(type: 2, instructionData: {
                allInstructions in
                self.refreshTableAfterLoadData(data: allInstructions)
            }
            )
            break
        case 3:

            instructionVm.loadAllInstructions(type: 3, instructionData: {
                allInstructions in
                self.refreshTableAfterLoadData(data: allInstructions)
            }
            )
            break
        default:
            break
        }


    }
    
    
    func  refreshTableAfterLoadData (data  :  [InstructionsModel]){
        if data.count  !=   0{
            self.allItems =  data
            
            self.arshataTableView.reloadData()
        }
        else {
            self.showAlert(message: NO_DATA, title:"")
        }
       // self.dismissLoader()
    }

    
    func prepareTab( button  : UIButton ,buttonTitle :String ){
        button.imageView?.contentMode = .scaleAspectFit
        
        button.setTitle(localizedString(forKey: buttonTitle, languageType: "ar"), for: UIControlState.normal)
        
        button.titleLabel?.font = UIFont.init(name: "HacenAlgeria", size: 23)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        arshataTableView.estimatedRowHeight = 100
        arshataTableView.rowHeight = UITableViewAutomaticDimension
    }
    
  
    
    func imageAlignmentINButton(button : UIButton){
//        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
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
