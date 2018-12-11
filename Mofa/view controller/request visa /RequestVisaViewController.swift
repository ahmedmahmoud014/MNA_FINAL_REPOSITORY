//
//  RequestVisaViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class RequestVisaViewController:BaseController ,SelectAttatchmentDelegate  , ScrollViewUpDelegate{
    
    var viewHeight : CGFloat!
    func moveUp(tag: Int) {
//
//            switch  tag {
//            case 2:
//                keyBoardHeight = 100
//                scrollView.scrollToTop(y: keyBoardHeight)
//                break
//            case 3:  keyBoardHeight = 140
//            scrollView.scrollToTop(y: keyBoardHeight)
//                break
//            case 4:
//                keyBoardHeight = 240
//                scrollView.scrollToTop(y: keyBoardHeight)
//
//                break
//            case 5:
//                keyBoardHeight = 300
//                scrollView.scrollToTop(y: keyBoardHeight)
//                containerHeight.constant  = 600
//
//                break
//            default :
//
//                SingletonClass().sharedInstance .scrollViewUPTag =  0
//                break
//
//            }
        
    }
    
    func moveDown() {
//        if keyBoardHeight != nil , keyBoardHeight != 0{
//            scrollView.scrollToTop(y : 0)
//            //containerHeight.constant  = 670
//
//        }
    }
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextBtnValue: LeftAlignedIconButton!
    @IBOutlet weak var backBtnValue: RightAlignedIconButton!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    var validationValue : String!
    var nameValidation: String!
    var recordIdValidation: String!
    var passPortIdValidation: String!
    var birthDateValidation: String!
    var phoneNumberValidation: String!
    var verifyValidation: String!
    var emailValidation: String!
    var countryValidation: String!
    var cityValidation: String!
    var representationValidation: String!
    var addresssValidation: String!
    var remarksValidation: String!
    var attachmentValidation: String!
    
    
    var indexOfView : Int =  0
    
    private lazy var firstStep =  generateViewConTroller(controllerName: "firstStepRequestVisaViewController")
    private lazy var secondStep = generateViewConTroller(controllerName: "SecondStepRequestVisaViewController")
    private lazy var thirdStep = generateViewConTroller(controllerName: "ThirdStepRequestVisaViewController")
    private lazy var verifyStep = generateViewConTroller(controllerName: "VerifyStepViewController")

    @IBOutlet weak var pageTilte: UIView!
    @IBOutlet weak var pageTitleValue: UILabel!
    @IBOutlet weak var marginTop: NSLayoutConstraint!
    
    
    
    
    var keyBoardHeight :Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //tab shap
        tabBarDisActive(type: 1)
        ThirdStepRequestHelpViewController.selectAttatchmentDelegate =  self
       // firstStepRequestVisaViewController.scrollViewUpDelegate  =   self
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
        
        //
        reIntialize ()
        
        // Do any additional setup after loading the view.
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
////        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//
//            print("\(SingletonClass().sharedInstance .scrollViewUPTag)")
//
//            if SingletonClass().sharedInstance .scrollViewUPTag > 1
//            {
//
//                switch  SingletonClass().sharedInstance .scrollViewUPTag {
//                case 2:
//                    keyBoardHeight = 100
//                    scrollView.scrollToTop(y: keyBoardHeight)
//                    break
//                case 3:  keyBoardHeight = 140
//                    scrollView.scrollToTop(y: keyBoardHeight)
//                    break
//                case 4:
//                    keyBoardHeight = 240
//                    scrollView.scrollToTop(y: keyBoardHeight)
//                    break
//                case 5:
//                    keyBoardHeight = 340
//                    scrollView.scrollToTop(y: keyBoardHeight)
//                    break
//                default :
//
//                    SingletonClass().sharedInstance .scrollViewUPTag =  0
//                    break
//
//                }
//
//
////            if self.scrollView.frame.origin.y == 174{
////                self.scrollView.frame.origin.y -= keyboardSize.height
////                keyBoardHeight  =  keyboardSize.height
////            }
////
//       //   }
//
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
////
//        if keyBoardHeight != nil , keyBoardHeight != 0{
//            scrollView.scrollToTop(y : 0)
//        }
//    }
    
    func  buttonTittle(backTitle :  String, backImage :  String  , nextTitle: String , nextImage: String){
    
        nextBtnValue.setImage(UIImage(named: nextImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        backBtnValue.setImage(UIImage(named: backImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        //
        nextBtnValue.setTitle( localizedString(forKey: nextTitle, languageType: "ar"), for: .normal);
        backBtnValue.setTitle(localizedString(forKey: backTitle, languageType: "ar"), for: .normal)
        
    }
    
    
    func validationIntial(){
        
         validationValue =  localizedString(forKey: "feildValidation", languageType: "ar")
         nameValidation =  localizedString(forKey: "fourName", languageType: "ar")
         recordIdValidation =  localizedString(forKey: "recordId", languageType: "ar")
         passPortIdValidation =  localizedString(forKey: "passportId", languageType: "ar")
         birthDateValidation =  localizedString(forKey: "birthDate", languageType: "ar")
         phoneNumberValidation =  localizedString(forKey: "phoneNumberValidation", languageType: "ar")
         verifyValidation =  localizedString(forKey: "verifyCode", languageType: "ar")
         emailValidation =  localizedString(forKey: "email", languageType: "ar")
         countryValidation =  localizedString(forKey: "countryGoto", languageType: "ar")
         cityValidation =  localizedString(forKey: "cityGoto", languageType: "ar")
         representationValidation =  localizedString(forKey: "representation", languageType: "ar")
         addresssValidation =  localizedString(forKey: "addressInCountry", languageType: "ar")
         remarksValidation =  localizedString(forKey: "remarks", languageType: "ar")
         attachmentValidation =  localizedString(forKey: "attachment", languageType: "ar")
        // dissagreeeeee button  and previous
        backBtnValue.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(21, backBtnValue.bounds.width / 8 , 21, backBtnValue.bounds.width / 12))
        // agreeeeee button  , next  and send
        nextBtnValue.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(21, nextBtnValue.bounds.width / 12 , 21, nextBtnValue.bounds.width / 8))

    }
    
    
    func addViewControllerToContainerView (index : Int ){
        
        
        switch index {
            
        case 0:
            pageTitleValue.text = localizedString(forKey: "firstStep", languageType: "ar")
            backBtnValue.isHidden  =  true
            buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "next", nextImage: "arrow_left")
            
            viewHeight = 530
            containerHeight.constant  =  viewHeight
            addViewControllerToContainer(asChildViewController: firstStep)
            break
        case 1:
            if RequestVisaSingleTone().sharedInstance.name .isEmpty{
                indexOfView -= 1
                showAlert(message: "\(validationValue!) \(nameValidation!)", title: "")
            }else{
                
                let validationMessage = "\(validationValue!) \(recordIdValidation!)"
                if !recordIdLength(record: RequestVisaSingleTone().sharedInstance.recordId, validationBody: validationMessage){
                indexOfView -= 1
            }else
                {
                    let validationMessage = "\(validationValue!) \(passPortIdValidation!)"

                if !passportIdLength(passportId: RequestVisaSingleTone().sharedInstance.passportId, validationBody: validationMessage){
                    indexOfView -= 1
                }else
                {
                    //if RequestVisaSingleTone().sharedInstance.passportId.equalLenghtTo(maxNumber: 15){
                        if RequestVisaSingleTone().sharedInstance.birthdate.isEmpty{
                            indexOfView -= 1
                            showAlert(message: "\(validationValue!) \(birthDateValidation!)", title: "")
                        }else
                        {
                            let validationMessage = "\(validationValue!) \(phoneNumberValidation!)"
                            if phoneNumberValidation(number : RequestVisaSingleTone().sharedInstance.phoneNumber , validationBody: validationMessage){
                                pageTitleValue.text = localizedString(forKey: "sesondStep", languageType: "ar")
                                buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "next", nextImage: "arrow_left")
                                backBtnValue.isHidden  =  false
                                viewHeight  =  300
                                containerHeight.constant  =  viewHeight
                                addViewControllerToContainer(asChildViewController: verifyStep)
                            }
                            else
                            {
                                indexOfView -= 1

                            }
                        }
                   
                }
                }

            }
//
            
            break
            
            
            
        case 2 :
            
            if RequestVisaSingleTone().sharedInstance.verfiyCode.isEmpty{
                indexOfView -= 1
                showAlert(message: "\(validationValue!) \(verifyValidation!)", title: "")
            }else
            {
                if RequestVisaSingleTone().sharedInstance.verfiyCode.count < 8{
                    indexOfView -= 1
                    showAlert(message: localizedString(forKey: "validationLessThan8", languageType: "ar"), title: "")
                }
                else {
                    
                    if RequestVisaSingleTone().sharedInstance.verfiyCode != "11111111" {
                        indexOfView -= 1
                        showAlert(message: localizedString(forKey: "validatinValue", languageType: "ar"), title: "")
                        
                        
                    }else{
                        
                        pageTitleValue.text = localizedString(forKey: "thirdStep", languageType: "ar")
                        buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "next", nextImage: "arrow_left")
                        backBtnValue.isHidden  =  false
                        viewHeight  =  600
                        containerHeight.constant  =  viewHeight
                        addViewControllerToContainer(asChildViewController: secondStep)
                        
                    }
                    
                }
                
            }
            break
            
            
        case 3:
            
            
        
                        
                        let validationMessage = "\(validationValue!) \(emailValidation!)"
                        if !emailLength(email: RequestVisaSingleTone().sharedInstance.email, validationBody: validationMessage){
                            indexOfView -= 1
                        }
                        else
                        {
                          
                                
                                if RequestVisaSingleTone().sharedInstance.country == 0 {
                                    indexOfView -= 1
                                    showAlert(message: "\(validationValue!) \(countryValidation!)", title: "")
                                }else
                                {
                                    if RequestVisaSingleTone().sharedInstance.city.isEmpty{
                                        indexOfView -= 1
                                        showAlert(message: "\(validationValue!) \(cityValidation!)", title: "")
                                    }else
                                    {
                                        if RequestVisaSingleTone().sharedInstance.representation == 0{
                                            indexOfView -= 1
                                            showAlert(message: "\(validationValue!) \(representationValidation!)", title: "")
                                        }else
                                        {
                                            if RequestVisaSingleTone().sharedInstance.details.isEmpty{
                                                indexOfView -= 1
                                                showAlert(message: "\(validationValue!) \(addresssValidation!)", title: "")
                                            }else
                                            {
                                                
                                                SingletonClass().sharedInstance.AllItemsFeild.removeAll()
                                                SingletonClass().sharedInstance.AllItemsFeild.append(AllItemsEnteredStruct(itemTitle:localizedString(forKey: "recordId", languageType: "ar"),itemValue:RequestVisaSingleTone().sharedInstance.recordId))
                                                
                                                SingletonClass().sharedInstance.AllItemsFeild.append(AllItemsEnteredStruct(itemTitle:localizedString(forKey: "passportId", languageType: "ar"),itemValue:RequestVisaSingleTone().sharedInstance.passportId))
                                                SingletonClass().sharedInstance.AllItemsFeild.append(AllItemsEnteredStruct(itemTitle:localizedString(forKey: "birthDate", languageType: "ar"),itemValue:RequestVisaSingleTone().sharedInstance.birthdate))
                                                SingletonClass().sharedInstance.AllItemsFeild.append(AllItemsEnteredStruct(itemTitle:localizedString(forKey: "name", languageType: "ar"),itemValue:RequestVisaSingleTone().sharedInstance.name))
                                                
                                                viewHeight = 650
                                                containerHeight.constant  = viewHeight
                                                
                                                pageTitleValue.text = localizedString(forKey: "fiveStep", languageType: "ar")
                                                scrollView.scrollToTop()
                                                
                                                nextBtnValue.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(21, nextBtnValue.bounds.width / 6 , 21, nextBtnValue.bounds.width / 8))
                                                
                                                buttonTittle(backTitle: "back",backImage: "arrow_right", nextTitle: "send", nextImage: "send_f")
                                                addViewControllerToContainer(asChildViewController: thirdStep)
                                            }
                                        }
                                    }
                                }
                       
            
                
                
           }
            
            
            break
        case 4:
            
            if  RequestVisaSingleTone().sharedInstance.addresss.isEmpty{
                indexOfView -= 1
                showAlert(message: "\(validationValue!) \(remarksValidation!)", title: "")
            }else
            {
                
                if RequestVisaSingleTone().sharedInstance.selectedImage == 0 {
                    indexOfView -= 1
                    showAlert(message: "\(validationValue!) \(attachmentValidation!)", title: "")
                }else
                {
                    
                    if Connectivity.isConnectedToInternet{
                        reIntialize ()
                        SingletonClass().sharedInstance.doneImage  = "done_visa"
                        SingletonClass().sharedInstance.doneTitle  = localizedString(forKey: "visa_done", languageType: "ar")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FiveStepRegistPassportAndTripDataUIViewController")
                        dismiss(animated: true, completion: nil)
                        self.show(vc!, sender: self)
                        
                    }else{
                        indexOfView -= 1

                        showAlert(message: localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
                    }

                 
                }
            }
            
            
            
            
            break
        default:
            break
        }
    }
    
    func reIntialize()
    {
        RequestVisaSingleTone().sharedInstance.selectedImage = 0
        RequestVisaSingleTone().sharedInstance.addresss  =  ""
        RequestVisaSingleTone().sharedInstance.details =  ""
        RequestVisaSingleTone().sharedInstance.representation =  0
        RequestVisaSingleTone().sharedInstance.country =  0
        RequestVisaSingleTone().sharedInstance.city  =  ""
        RequestVisaSingleTone().sharedInstance.email  =  ""
        RequestVisaSingleTone().sharedInstance.verfiyCode  =  ""
        RequestVisaSingleTone().sharedInstance.phoneNumber  =  ""
        RequestVisaSingleTone().sharedInstance.birthdate  =  ""
        RequestVisaSingleTone().sharedInstance.passportId  =  ""
        RequestVisaSingleTone().sharedInstance.recordId  =  ""
        RequestVisaSingleTone().sharedInstance.name  =  ""
        SingletonClass().sharedInstance.countryValue =  10000000
        SingletonClass().sharedInstance.travelType =  10000010

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
        
        containerHeight.constant = viewHeight +  65
    }
    
    func decreaseHeight() {
        print("arrrrrddd")
        containerHeight.constant =  viewHeight - 65
        
    }
    
    
    
}

