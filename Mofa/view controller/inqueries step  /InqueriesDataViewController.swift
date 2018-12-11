//
//  InqueriesDataViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-29.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//



import UIKit

class InqueriesDataViewController: BaseController , UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var allrequestTilte: UILabel!
    @IBOutlet weak var reqestTableView: UITableView!
    @IBOutlet weak var dataTitle: UILabel!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var requestDataTitle: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
//    private lazy var firstStep =  generateViewConTroller(controllerName: "InqueriesImportantDataViewController")

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageViewLabe: UILabel!
    @IBOutlet weak var pageViewTitle: UIView!
    // @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    @IBOutlet weak var requestNumber: UILabel!
    @IBOutlet weak var requestNumberValue: UILabel!
    @IBOutlet weak var requestDate: UILabel!
    @IBOutlet weak var requestDateValue: UILabel!
    @IBOutlet weak var requestType: UILabel!
    @IBOutlet weak var requestTypeValue: UILabel!
    var mainInqueriesStruct : MainInqueriesStruct!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func generateViewConTroller(controllerName :  String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
        // Add View Controller as Child View Controller
        //self.addViewControllerToContainer(asChildViewController: viewController)
        return viewController
    }
    
    fileprivate func addViewControllerToContainer(asChildViewController viewController: UIViewController) {
        
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        viewController.view.backgroundColor =  UIColor.clear
        viewController.view.frame = CGRect(x: 0, y: 0, width:containerView.bounds.width, height:  containerView.bounds.height) //Here
        self.containerView.addSubview(viewController.view)
        self.addChildViewController(viewController)
        viewController.didMove(toParentViewController: self.parent)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if  mainInqueriesStruct.allRequestList.count ==  0{
            
            
        allrequestTilte.isHidden  = true
            return 0

        }else {
            allrequestTilte.isHidden  = false
            return mainInqueriesStruct.allRequestList.count
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // for determind which  step  will  appear 
        mainInqueriesStruct =  MainInqueriesViewModel().assignDateToView(screenNumber: InquerySingleTone().sharedInstance.selectStep)
        print("vvvvvvvvv \(mainInqueriesStruct!)")
        if mainInqueriesStruct.allInQuertItems.count !=  0 {
        tableViewHeight.constant =  180 + CGFloat(mainInqueriesStruct.allRequestList.count * 80)
        
        
        
        //if InquerySingleTone().sharedInstance.selectStep == 1{
            assignValueToTopItems(InqueryItems: [mainInqueriesStruct.allInQuertItems[0],mainInqueriesStruct.allInQuertItems[1],mainInqueriesStruct.allInQuertItems[2]])
        if mainInqueriesStruct.allRequestList.count == 0 {
          //  noDataView.isHidden =  true

            requestDataTitle.isHidden   = false
            dataTitle.text   =  localizedString(forKey: "dataTitle", languageType: "ar")
        }
            
        }else {
            noDataView.isHidden =  true
            dataTitle.text   =  localizedString(forKey: "noData", languageType: "ar")

        }
        
        
        
      //  }
//        else {
//            assignValueToTopItems(InqueryItems: [mainInqueriesStruct.allInQuertItems[4],mainInqueriesStruct.allInQuertItems[2],mainInqueriesStruct.allInQuertItems[1]])
//        }
        
    }
    
    func assignValueToTopItems (InqueryItems : [InqueryItems]){
        requestType.text = InqueryItems[2].title
        requestTypeValue.text =  InqueryItems[2].value
        requestDateValue.text = InqueryItems[1].value
        requestDate.text =  InqueryItems[1].title
        requestNumberValue.text =  InqueryItems[0].value
        requestNumber.text =  InqueryItems[0].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "InqueriesDataTableViewCell", for: indexPath) as! InqueriesDataTableViewCell
        cell.asssignValues(allInqueriesRequestStruct: mainInqueriesStruct.allRequestList[indexPath.section])
        cell.addShadowR(roundBorder: 20, opacity: 0.1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        InqueriesTopDataViewController.pageTitleText  = mainInqueriesStruct.allRequestList[indexPath.section].requestName
        InqueriesTopDataViewController.showTopView =  1
        InqueriesTopDataViewController.allData = mainInqueriesStruct.allRequestList[indexPath.section].allData
        if(Connectivity.isConnectedToInternet ){

        moveTo(name:"InqueriesTopDataViewController" ,backTo: "InqueriesDataViewController")
        
    }
    else{
    showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
    
    }

    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //
        //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
        let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 10))
        footerView.backgroundColor = UIColor.clear
        
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    @IBOutlet weak var allRequestDataTable: UITableView!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pageViewLabe.text =  InquerySingleTone().sharedInstance.pageTilte
        pageViewTitle.addShadow(roundBorder: 20, opacity: 0.1)
        
        detailsBtn.addShadow(roundBorder: 20, opacity: 0.2)
        detailsBtn.setImage(UIImage(named: "arrow_left.png"), for: .normal)
        setNavigationBar(shomeHome: true, showBack: true)
        tabBarDisActive(type: 1)

        
        containerView.addShadow(roundBorder: 20, opacity: 0.1)
//        addViewControllerToContainer(asChildViewController: firstStep)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    @IBAction func showAllDetailsAction(_ sender: UIButton) {
        
        InqueriesTopDataViewController.allData = mainInqueriesStruct.allInQuertItems
        
       // moveTo(name: "InqueriesTopDataViewController")
        
        
        if(Connectivity.isConnectedToInternet ){
            InqueriesTopDataViewController.pageTitleText =   ""
        InqueriesTopDataViewController.showTopView =  0
        moveTo(name:"InqueriesTopDataViewController" ,backTo: "InqueriesDataViewController")

        } else{
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
