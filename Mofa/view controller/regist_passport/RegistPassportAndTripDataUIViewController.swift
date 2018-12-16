//
//  RegistPassportAndTripDataUIViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class RegistPassportAndTripDataUIViewController: BaseController   , ScrollViewUpDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextBtnValue: UIButton!
    @IBOutlet weak var backBtnValue: UIButton!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!

    var indexOfView : Int =  0

    private lazy var firstStep =  generateViewConTroller(controllerName: "FirstStepRegistPassportAndTripDataUIViewController")
    private lazy var secondStep = generateViewConTroller(controllerName: "SecondStepRegistPassportAndTripDataUIViewController")
    private lazy var thirdStep = generateViewConTroller(controllerName: "ThirdStepRegistPassportAndTripDataUIViewController")
    private lazy var fourdStep = generateViewConTroller(controllerName: "FourthStepRegistPassportAndTripDataUIViewController")
    private lazy var fiveStep = generateViewConTroller(controllerName: "FiveStepRegistPassportAndTripDataUIViewController")

    @IBOutlet weak var pageTilte: UIView!
    @IBOutlet weak var pageTitleValue: UILabel!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    
    
    
    var validationValue : String!
    var nameValidation: String!
    var recordIdValidation: String!
    var passPortIdValidation: String!
    var phoneNumberValidation: String!
    var verifyValidation: String!
    var emailValidation: String!
    var countryValidation: String!
    var cityValidation: String!
    var representationValidation: String!
    var addresssValidation: String!
    var arrivalDateValidation: String!
    var leaveDateValidation: String!

    var attachmentValidation: String!
    
    var friendNameValidation: String!
    var friendPhoneValidation: String!

    
    
    
    func validationIntial(){
        validationValue =  localizedString(forKey: "feildValidation", languageType: "ar")
        nameValidation =  localizedString(forKey: "fourName", languageType: "ar")
        recordIdValidation =  localizedString(forKey: "recordId", languageType: "ar")
        passPortIdValidation =  localizedString(forKey: "passportId", languageType: "ar")
        phoneNumberValidation =  localizedString(forKey: "phoneNumberValidation", languageType: "ar")
        emailValidation =  localizedString(forKey: "email", languageType: "ar")
        countryValidation =  localizedString(forKey: "countryGoto", languageType: "ar")
        cityValidation =  localizedString(forKey: "cityGoto", languageType: "ar")
        representationValidation =  localizedString(forKey: "travelingType", languageType: "ar")
        addresssValidation =  localizedString(forKey: "addressInCountry", languageType: "ar")
        arrivalDateValidation =  localizedString(forKey: "arraivalDate", languageType: "ar")
        leaveDateValidation =  localizedString(forKey: "leaveDate", languageType: "ar")
        attachmentValidation =  localizedString(forKey: "passportImage", languageType: "ar")
        friendNameValidation =  localizedString(forKey: "friendName", languageType: "ar")
        friendPhoneValidation =  localizedString(forKey: "friendPhone", languageType: "ar")

        
        
        // dissagreeeeee button  and previous
        backBtnValue.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(21, backBtnValue.bounds.width / 8 , 21, backBtnValue.bounds.width / 12))
        // agreeeeee button  , next  and send
        nextBtnValue.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(21, nextBtnValue.bounds.width / 12 , 21, 10))
        
        
    }
    
    var keyBoardHeight :Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tab shap
        tabBarDisActive(type: 1)
        // keyboad scroll
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        //add top margin
        deviceTypeForMarginTop(marginTop: marginTop)
        // assign  firstValue to  containerView
        //containerHeight.constant  =  200
        addViewControllerToContainerView(index: indexOfView)
       // add navigation  bar
        setNavigationBar(shomeHome: false, showBack: true)
        
      //  SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate = self
        
        
//        containerView.addShadow(roundBorder: 20, opacity: 0.1)
        pageTilte.addShadow(roundBorder: 20, opacity: 0.1)
        nextBtnValue.addShadow(roundBorder: 20, opacity: 0.1)
        backBtnValue.addShadow(roundBorder: 20, opacity: 0.1)
        
        
        
        validationIntial()
        reIntialize ()
        
        // Do any additional setup after loading the view.
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                print("\( keyboardSize.height)")
//                keyBoardHeight  =  keyboardSize.height
//                self.view.frame.origin.y -= keyBoardHeight
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
        
        var  mesaage : String!
        switch index {
            
            
          
        case 0:
            buttonTittle(backTitle: "disagree", backImage: "not_accept", nextTitle: "agree", nextImage: "accept")
            pageTitleValue.text = localizedString(forKey: "firstStep", languageType: "ar")
            containerHeight.constant  =  250
            addViewControllerToContainer(asChildViewController: firstStep)
            break
        case 1:
           
                pageTitleValue.text = localizedString(forKey: "sesondStep", languageType: "ar")
                buttonTittle(backTitle: "back",backImage: "arrow_right_30", nextTitle: "next", nextImage: "arrow_left")
                containerHeight.constant  =  530
                addViewControllerToContainer(asChildViewController: secondStep)
            
          
            
            break
        case 2:
        
        if RegistPassportSingletone().sharedInstance.name.isEmpty{
            indexOfView -= 1
            showAlert(message: "\(validationValue!) \(nameValidation!)", title: "")

        }else
        {
            mesaage   = "\(validationValue!) \(passPortIdValidation!)"
                    if !passportIdLength(passportId: RegistPassportSingletone().sharedInstance.passportId, validationBody: mesaage){
                indexOfView -= 1

            }else
                    {
                        mesaage   = "\(validationValue!) \(recordIdValidation!)"
                if !recordIdLength(record: RegistPassportSingletone().sharedInstance.RECORDID, validationBody: mesaage){
                    indexOfView -= 1
                    showAlert(message: "\(validationValue!) \(recordIdValidation!)", title: "")

                }else
                {
                    if RegistPassportSingletone().sharedInstance.selectedImage == 0{
                        indexOfView -= 1
                        showAlert(message: "\(validationValue!) \(attachmentValidation!)", title: "")

                    }else
                    {
                        pageTitleValue.text = localizedString(forKey: "thirdStep", languageType: "ar")
                        buttonTittle(backTitle: "back",backImage: "arrow_right_30", nextTitle: "next", nextImage: "arrow_left")
                        containerHeight.constant  =  500
                        addViewControllerToContainer(asChildViewController: thirdStep)
                    }
                }
            }
        }
        
       
        
        
            break
        case 3:
            mesaage   = "\(validationValue!) \(phoneNumberValidation!)"

            if !phoneNumberValidation(number: RegistPassportSingletone().sharedInstance.phoneNumber, validationBody: mesaage){
                indexOfView -= 1
            }else
            {
                mesaage   = "\(validationValue!) \(emailValidation!)"
                if !emailLength(email: RegistPassportSingletone().sharedInstance.email, validationBody: mesaage){
                    indexOfView -= 1
                }else
                {
                    if RegistPassportSingletone().sharedInstance.friendName.isEmpty{
                        indexOfView -= 1
                        showAlert(message: "\(validationValue!) \(friendNameValidation!)", title: "")
                    }else
                    {
                        mesaage   = "\(validationValue!) \(friendPhoneValidation!)"
                        
                        if !phoneNumberValidation(number: RegistPassportSingletone().sharedInstance.friendPhone, validationBody: mesaage){
                            indexOfView -= 1
                        }else
                        {
                             nextBtnValue.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(21, nextBtnValue.bounds.width / 6 , 21, nextBtnValue.bounds.width / 8))
                            pageTitleValue.text = localizedString(forKey: "fourStep", languageType: "ar")
                            buttonTittle(backTitle: "back",backImage: "arrow_right_30", nextTitle: "send", nextImage: "send_f")
                            containerHeight.constant  =  600
                            addViewControllerToContainer(asChildViewController: fourdStep)
                        }
                    }
                }
            }
            
            
            break
        case 4:
            
            if RegistPassportSingletone().sharedInstance.trvaleType == 0{
                indexOfView -= 1
                showAlert(message: "\(validationValue!) \(representationValidation!)", title: "")
            }else
            {
                if RegistPassportSingletone().sharedInstance.country == 0{
                    indexOfView -= 1
                    showAlert(message: "\(validationValue!) \(countryValidation!)", title: "")
                }else
                {
                    if RegistPassportSingletone().sharedInstance.city.isEmpty{
                        indexOfView -= 1
                        showAlert(message: "\(validationValue!) \(cityValidation!)", title: "")
                    }else
                    {
                        if RegistPassportSingletone().sharedInstance.arrivalDate.isEmpty{
                            indexOfView -= 1
                            showAlert(message: "\(validationValue!) \(arrivalDateValidation!)", title: "")
                        }else
                        {
                            if RegistPassportSingletone().sharedInstance.leaveDate.isEmpty{
                                indexOfView -= 1
                                showAlert(message: "\(validationValue!) \(leaveDateValidation!)", title: "")
                            }else
                            {
                                if RegistPassportSingletone().sharedInstance.address.isEmpty{
                                    indexOfView -= 1
                                    showAlert(message: "\(validationValue!) \(addresssValidation!)", title: "")
                                }else
                                {
                                    
                                    if Connectivity.isConnectedToInternet{
                                        reIntialize ()
                                        SingletonClass().sharedInstance.doneImage  = "done_passport"
                                        SingletonClass().sharedInstance.doneTitle  = localizedString(forKey: "registPassportDone", languageType: "ar")
                                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FiveStepRegistPassportAndTripDataUIViewController")
                                        dismiss(animated: true, completion: nil)
                                        self.show(vc!, sender: self)
                                    }else{
                                        showAlert(message: localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
                                        indexOfView -= 1

                                    }
                                   
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                }
            }
            
            
        
            break
        default:
            break
        }
    }
    
    
    func  reIntialize ()  {
        SecondStepRegistPassportAndTripDataUIViewController.getRegularValue   =  nil
    RegistPassportSingletone().sharedInstance.leaveDate = ""
        RegistPassportSingletone().sharedInstance.address = ""
        RegistPassportSingletone().sharedInstance.arrivalDate = ""
        
       RegistPassportSingletone().sharedInstance.city = ""
        RegistPassportSingletone().sharedInstance.country = 0
        RegistPassportSingletone().sharedInstance.trvaleType = 0
        
       RegistPassportSingletone().sharedInstance.friendPhone = ""
       RegistPassportSingletone().sharedInstance.friendName = ""
      RegistPassportSingletone().sharedInstance.phoneNumber = ""
        RegistPassportSingletone().sharedInstance.email = ""

        
        RegistPassportSingletone().sharedInstance.name = ""
        RegistPassportSingletone().sharedInstance.RECORDID = ""
        RegistPassportSingletone().sharedInstance.passportId = ""
        RegistPassportSingletone().sharedInstance.selectedImage =  0
        SingletonClass().sharedInstance.countryValue =  1000000
        SingletonClass().sharedInstance.travelType =  10000000

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
    
    override func viewWillDisappear(_ animated: Bool) {
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
        scrollView.scrollToTop()
//        removeView(asChildViewController: firstStep)
        if indexOfView == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomePageTableView")
            dismiss(animated: true, completion: nil)
            self.show(vc!, sender: self)
        }else {
            indexOfView -= 1
            addViewControllerToContainerView(index: indexOfView)

        }
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
