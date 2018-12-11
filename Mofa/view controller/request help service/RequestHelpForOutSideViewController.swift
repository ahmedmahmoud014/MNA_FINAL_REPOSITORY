//
//  RequestHelpForOutSideViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class RequestHelpForOutSideViewController:  BaseController ,SelectAttatchmentDelegate   , ScrollViewUpDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextBtnValue: LeftAlignedIconButton!
    @IBOutlet weak var backBtnValue: RightAlignedIconButton!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    var indexOfView : Int =  0
    
    private lazy var firstStep =  generateViewConTroller(controllerName: "FirstStepRequestHelpViewController")
    private lazy var secondStep = generateViewConTroller(controllerName: "SecondStepRequestHelpViewController")
    private lazy var thirdStep = generateViewConTroller(controllerName: "ThirdStepRequestHelpViewController")
    private lazy var fourdStep = generateViewConTroller(controllerName: "FourthStepRegistPassportAndTripDataUIViewController")
    private lazy var fiveStep = generateViewConTroller(controllerName: "FiveStepRegistPassportAndTripDataUIViewController")
    @IBOutlet weak var pageTilte: UIView!
    @IBOutlet weak var pageTitleValue: UILabel!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    
    var validationValue : String!
    var firstNameValidation: String!
    var fatherNameValidation: String!
    var grandFatherNameValidation: String!
    var familyNameValidation: String!
    var passportIdValidation: String!
    var recordIDValidation: String!
    var phoneNumberValidation: String!
    var emailValidation: String!
    var countryValidation: String!
    var cityValidation: String!
    var representationValidation: String!
    var addresssValidation: String!
    var detailsValidation: String!
    var attachmentValidation: String!
    var attachmentValidationFour: String!
    

    
    
    func validationIntial(){
        
        
        
        validationValue =  localizedString(forKey: "feildValidation", languageType: "ar")
        firstNameValidation =  localizedString(forKey: "fristName", languageType: "ar")
        fatherNameValidation =  localizedString(forKey: "fahterName", languageType: "ar")
        grandFatherNameValidation =  localizedString(forKey: "grandfahterName", languageType: "ar")
        familyNameValidation =  localizedString(forKey: "familyName", languageType: "ar")
        recordIDValidation =  localizedString(forKey: "recordId", languageType: "ar")
        passportIdValidation =  localizedString(forKey: "passportId", languageType: "ar")
        phoneNumberValidation =  localizedString(forKey: "phoneNumberValidation", languageType: "ar")
        emailValidation =  localizedString(forKey: "email", languageType: "ar")
        countryValidation =  localizedString(forKey: "countryGoto", languageType: "ar")
        cityValidation =  localizedString(forKey: "cityGoto", languageType: "ar")
        representationValidation =  localizedString(forKey: "representation", languageType: "ar")
        addresssValidation =  localizedString(forKey: "addressInCountry", languageType: "ar")
        detailsValidation =  localizedString(forKey: "helpDetails", languageType: "ar")
        attachmentValidation =  localizedString(forKey: "attachment", languageType: "ar")
        attachmentValidationFour =  localizedString(forKey: "attachmentFour", languageType: "ar")
        
        // dissagreeeeee button  and previous
        backBtnValue.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(21, backBtnValue.bounds.width / 8 , 21, backBtnValue.bounds.width / 12))
        // agreeeeee button  , next  and send
        nextBtnValue.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(21, nextBtnValue.bounds.width / 12 , 21, nextBtnValue.bounds.width / 8))

    }
    
    
    
    var keyBoardHeight :Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
       
        
        //tab shap
        tabBarDisActive(type: 1)
        ThirdStepRequestHelpViewController.selectAttatchmentDelegate =  self
       // FirstStepRequestHelpViewController.scrollViewUpDelegate  =   self

        // keyboad scroll
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//
        //add top margin
        deviceTypeForMarginTop(marginTop: marginTop)
        // assign  firstValue to  containerView
        //containerHeight.constant  =  200
        addViewControllerToContainerView(index: indexOfView)
        // add navigation  bar
        setNavigationBar(shomeHome: false, showBack: true)
        
        
        //        containerView.addShadow(roundBorder: 20, opacity: 0.1)
        pageTilte.addShadow(roundBorder: 20, opacity: 0.1)
        nextBtnValue.addShadow(roundBorder: 20, opacity: 0.1)
        backBtnValue.addShadow(roundBorder: 20, opacity: 0.1)
        
        
        // validation
        validationIntial()
        
        reIntialalize ()
        
        
        // Do any additional setup after loading the view.
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//                keyBoardHeight  =  keyboardSize.height
//
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += keyBoardHeight
//            }
//        }
//    }
    
    func  buttonTittle(backTitle :  String, backImage :  String  , nextTitle: String , nextImage: String){
        
        
        nextBtnValue.setImage(UIImage(named: nextImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        backBtnValue.setImage(UIImage(named: backImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        //
        nextBtnValue.setTitle( localizedString(forKey: nextTitle, languageType: "ar"), for: .normal);   backBtnValue.setTitle(localizedString(forKey: backTitle, languageType: "ar"), for: .normal)
        
    }
    
    
    
    
   
    
    
    func addViewControllerToContainerView (index : Int ){
        switch index {
            
            
            
//            firstStep =  "الخطوة الأولي";
//            sesondStep =  "الخطوة الثانية";
//            thirdStep =  "الخطوة الثالثة";
//            fourStep =  "الخطوة الرابعة";
//            fiveStep =  "الخطوة الأخيرة";
            
        
            
        case 0:
            pageTitleValue.text = localizedString(forKey: "firstStep", languageType: "ar")
            backBtnValue.isHidden  =  true
          buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "next", nextImage: "arrow_left")
            containerHeight.constant  =  550
            addViewControllerToContainer(asChildViewController: firstStep)
            break
        case 1:
            
            
            if RequestHelpSingleTone().sharedInstance.firstname.isEmpty{
                indexOfView -= 1
                showAlert(message: "\(validationValue!) \(firstNameValidation!)", title: "")
            }else
            {
                if RequestHelpSingleTone().sharedInstance.fathername.isEmpty{
                    indexOfView -= 1
                    showAlert(message: "\(validationValue!) \(fatherNameValidation!)", title: "")
                }else
                {
                    if RequestHelpSingleTone().sharedInstance.grandFahterName.isEmpty{
                        indexOfView -= 1
                        showAlert(message: "\(validationValue!) \(grandFatherNameValidation!)", title: "")
                    }else
                    {
                        if RequestHelpSingleTone().sharedInstance.familyName.isEmpty{
                            indexOfView -= 1
                            showAlert(message: "\(validationValue!) \(familyNameValidation!)", title: "")
                        }else
                        {
                            let validationMessage = "\(validationValue!) \(passportIdValidation!)"
                            if !passportIdLength(passportId:RequestHelpSingleTone().sharedInstance.passportId, validationBody: validationMessage){
                                indexOfView -= 1
                            }
                            else
                            {
                                let validationMessage = "\(validationValue!) \(recordIDValidation!)"
                                if !recordIdLength(record: RequestHelpSingleTone().sharedInstance.recordId, validationBody: validationMessage){
                                    indexOfView -= 1
                                   
                                }else
                                {
                                    pageTitleValue.text = localizedString(forKey: "sesondStep", languageType: "ar")
                                    buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "next", nextImage: "arrow_left")
                                    backBtnValue.isHidden  =  false
                                    containerHeight.constant  =  550
                                    addViewControllerToContainer(asChildViewController: secondStep)
                                }
                            }
                        }
                    }
                }
            }
            
          
            break
        case 2:
            let validationMessage = "\(validationValue!) \(phoneNumberValidation!)"
            if !phoneNumberValidation(number : RequestHelpSingleTone().sharedInstance.phoneNumber , validationBody: validationMessage){
                indexOfView -= 1
            }else
            {
                let validationMessage = "\(validationValue!) \(emailValidation!)"
                if  !emailLength(email: RequestHelpSingleTone().sharedInstance.email, validationBody: validationMessage){
                    indexOfView -= 1
                }else
                {
                    if RequestHelpSingleTone().sharedInstance.country == 0 {
                        indexOfView -= 1
                        showAlert(message: "\(validationValue!) \(countryValidation!)", title: "")
                    }else
                    {
                        if RequestHelpSingleTone().sharedInstance.city.isEmpty{
                            indexOfView -= 1
                            showAlert(message: "\(validationValue!) \(cityValidation!)", title: "")
                        }else
                        {
                            if RequestHelpSingleTone().sharedInstance.representation == 0{
                                indexOfView -= 1
                                showAlert(message: "\(validationValue!) \(representationValidation!)", title: "")
                            }else
                            {
                                if RequestHelpSingleTone().sharedInstance.address.isEmpty{
                                    indexOfView -= 1
                                    showAlert(message: "\(validationValue!) \(addresssValidation!)", title: "")
                                }else
                                {
                                    pageTitleValue.text = localizedString(forKey: "fiveStep", languageType: "ar")
                                    scrollView.scrollToTop()
                                     nextBtnValue.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(21, nextBtnValue.bounds.width / 6 , 21, nextBtnValue.bounds.width / 8))
                                    buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "send", nextImage: "send_f")
                                    if SingletonClass().sharedInstance.allImageSelected.count == 0{
                                        containerHeight.constant  = 400
                                    }
                                    else {
                                        containerHeight.constant = containerView.bounds.height +   CGFloat(SingletonClass().sharedInstance.allImageSelected.count * 30)
                                        
                                    }
                                    addViewControllerToContainer(asChildViewController: thirdStep)
                                }
                            }
                        }
                    }
                }
            }
            
            
            
          
            break
        case 3:
            
            if RequestHelpSingleTone().sharedInstance.details.isEmpty{
                indexOfView -= 1
                showAlert(message: "\(validationValue!) \(detailsValidation!)", title: "")
            }else
            {
                
                if SingletonClass().sharedInstance.allImageSelected.count == 0{
                    indexOfView -= 1
                    showAlert(message: "\(validationValue!) \(attachmentValidation!)", title: "")
                }
                else{
//                    if SingletonClass().sharedInstance.allImageSelected.count < 4{
//                        indexOfView -= 1
//                        showAlert(message: "\(validationValue!) \(attachmentValidationFour!)", title: "")
//                    }
//                    else{
                    
                        if Connectivity.isConnectedToInternet{
                            
                            self.reIntialalize ()
                            SingletonClass().sharedInstance.doneImage  = "done_help"
                            SingletonClass().sharedInstance.doneTitle  = self.localizedString(forKey: "doneHelp", languageType: "ar")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FiveStepRegistPassportAndTripDataUIViewController")
                            self.dismiss(animated: true, completion: nil)
                            self.show(vc!, sender: self)
                            
                            
                          
                            
//                            let parameters  =
//                                ["userId":"wewew23234343dcvcvcv5435435","firstName":RequestHelpSingleTone().sharedInstance.firstname,"fartherName":RequestHelpSingleTone().sharedInstance.fathername,"grandFatherName":RequestHelpSingleTone().sharedInstance.grandFahterName,"passportId":RequestHelpSingleTone().sharedInstance.passportId,"nationalId":RequestHelpSingleTone().sharedInstance.recordId,"phoneNumber":RequestHelpSingleTone().sharedInstance.phoneNumber,"email":RequestHelpSingleTone().sharedInstance.email,"city":RequestHelpSingleTone().sharedInstance.city,"mission":"rreere","address":RequestHelpSingleTone().sharedInstance.address,"helpDetails":RequestHelpSingleTone().sharedInstance.details,"attachment":["image1","image2","image3","image4"]] as [String : Any]
//
//                            print("testeeeee  \(parameters)")
//                            CallAPI().postData(url: HelpRequestUrl , parameters: parameters) { (result, code) in
//                                if code  == 201 {
//                                    // after upoaded of data
//                                    self.reIntialalize ()
//                                    SingletonClass().sharedInstance.doneImage  = "done_help"
//                                    SingletonClass().sharedInstance.doneTitle  = self.localizedString(forKey: "doneHelp", languageType: "ar")
//                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "FiveStepRegistPassportAndTripDataUIViewController")
//                                    self.dismiss(animated: true, completion: nil)
//                                     self.show(vc!, sender: self)
//                                }else {
//                                    self.showAlert(message: "error  occured ", title: "error")
//                                }
//
//                            }
//
//
//
                            
                            
                        }
                        else{
                            indexOfView -= 1
                            showAlert(message: localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
                        }

                        
                    //}
                    
                }
                
            }
            
           
            
            
            break
        default:
            break
        }
    }
    
    
    func  reIntialalize (){
       SingletonClass().sharedInstance.allImageSelected.removeAll()
        RequestHelpSingleTone().sharedInstance.details = ""
        RequestHelpSingleTone().sharedInstance.address = ""
        RequestHelpSingleTone().sharedInstance.representation = 0
        RequestHelpSingleTone().sharedInstance.country = 0
        RequestHelpSingleTone().sharedInstance.city = ""
        RequestHelpSingleTone().sharedInstance.phoneNumber = ""
        RequestHelpSingleTone().sharedInstance.email = ""
        RequestHelpSingleTone().sharedInstance.recordId = ""
        RequestHelpSingleTone().sharedInstance.firstname = ""
        RequestHelpSingleTone().sharedInstance.fathername = ""
        RequestHelpSingleTone().sharedInstance.familyName = ""
        RequestHelpSingleTone().sharedInstance.grandFahterName = ""
        RequestHelpSingleTone().sharedInstance.passportId = ""
        SingletonClass().sharedInstance.countryValue =  10000000
        SingletonClass().sharedInstance.travelType =  10000
        
        
    }
    
    func generateViewConTroller(controllerName :  String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
        // Add View Controller as Child View Controller
        //self.addViewControllerToContainer(asChildViewController: viewController)
        return viewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func removeView(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
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
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        indexOfView += 1
        scrollView.scrollToTop()
        //  scrollView.scrollsToTop = true
        //        removeView(asChildViewController: secondStep)
        //        addViewControllerToContainer(asChildViewController: secondStep)
        
        
        addViewControllerToContainerView(index: indexOfView)
        
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        indexOfView -= 1
        scrollView.scrollToTop()
        //        removeView(asChildViewController: firstStep)
        addViewControllerToContainerView(index: indexOfView)
    }
    
    func addHeight() {
        print("addddd")
        containerHeight.constant = containerView.bounds.height + 65
    }
    
    func decreaseHeight() {
        print("arrrrrddd")

        containerHeight.constant =  containerView.bounds.height - 65
        
    }
    
    func moveUp(tag: Int) {
        
//        switch  tag {
//        case 2:
//            keyBoardHeight = 100
//            scrollView.scrollToTop(y: keyBoardHeight)
//            break
//        case 3:  keyBoardHeight = 140
//        scrollView.scrollToTop(y: keyBoardHeight)
//            break
//        case 4:
//            keyBoardHeight = 240
//            scrollView.scrollToTop(y: keyBoardHeight)
//            break
//
//        case 5:
//            keyBoardHeight = 500
//            scrollView.scrollToTop(y: keyBoardHeight)
//            break
//
//        default :
//
//
//            SingletonClass().sharedInstance .scrollViewUPTag =  0
//            break
//
//        }
        
    }
    
    func moveDown() {
//        if keyBoardHeight != nil , keyBoardHeight != 0{
//            scrollView.scrollToTop(y : 0)
//        }
    }
    
    
    
   
    
    
}

