//
//  BaseController.swift
//  kinetics
//
//  Created by iOSAccount on 2/5/18.
//  Copyright © 2018 testtableheader. All rights reserved.
//

import UIKit
import JGProgressHUD
import DocumentReader
import Photos
class BaseController: UIViewController {
    
    var  hud :JGProgressHUD!
    var doneButton : UIButton!;
    
    var docReader: DocReader?
    
    var imagePickerGallery = UIImagePickerController()


    var   viewControllerForRegula : BaseController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // for hide tool bar while navigation
        self.navigationController?.isNavigationBarHidden = true
        
        

        
        // get font name 
//        for fontFamilyName in UIFont.familyNames{
//            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName){
//                print("Family: \(fontFamilyName)     Font: \(fontName)")
//            }
//        }

// for loader intialized 
        hud = JGProgressHUD(style: .light)
    }
    
    
    func  addPlaceHolder (textView : UITextView,textPlace : String ,tag : Int ,textDelegate : UITextViewDelegate){
        textView.delegate = textDelegate.self
        textView.tag  = tag
        textView.text = textPlace
        textView.textColor = UIColor.lightGray
        textView.addShadowR(roundBorder: 20, opacity: 0.1)
        textView.font   = UIFont.init(name: "HacenAlgeria", size: 20)!
        textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)
        
    }
    
    func  addPlaceHolderMarginTop (marginTop : CGFloat ,textView : UITextView,textPlace : String ,tag : Int ,textDelegate : UITextViewDelegate){
        textView.delegate = textDelegate.self
        textView.tag  = tag
        textView.text = textPlace
        textView.textColor = UIColor.lightGray
        textView.addShadowR(roundBorder: 20, opacity: 0.1)
        textView.font   = UIFont.init(name: "HacenAlgeria", size: 20)!
        textView.textContainerInset = UIEdgeInsetsMake(marginTop, 5, 5, 5)
        
    }
    
    
    
    func recordIdLength(record : String ,validationBody : String ) -> Bool{
        
        // recordLength
        var status : Bool!
        
        
        if !record.isEmpty{
            if record.equalLenghtTo(maxNumber: 10)
            {
                status  =  true
            }
                
            else {
                status  =  false
                showAlert(message: localizedString(forKey: "recordLength", languageType: "ar"), title: "")
            }
            
        }
        else{
            status  =  false
            showAlert(message: validationBody, title: "")
            
            
        }
        
        
        
        return status
    }
    
    func passportIdLength(passportId : String ,validationBody : String  ) -> Bool{
        
        // recordLength
        var status : Bool!
        
        
        if !passportId.isEmpty{
            if passportId.equalLenghtTo(maxNumber: 9)
            {
                status  =  true
            }
                
            else {
                status  =  false
                showAlert(message: localizedString(forKey: "passportLength", languageType: "ar"), title: "")
            }
            
        }
        else{
            status  =  false
            showAlert(message: validationBody, title: "")
            
            
        }
        
        
        
        return status
    }
    
    
    
    func emailLength(email : String ,validationBody : String  ) -> Bool{
        
        // recordLength
        var status : Bool!
        
        
        if !email.isEmpty{
            if email.isValidEmail()
            {
                status  =  true
            }
                
            else {
                status  =  false
                showAlert(message: localizedString(forKey: "notValidEmail", languageType: "ar"), title: "")
            }
        }
        else{
            status  =  false
            showAlert(message: validationBody, title: "")
        }
        return status
    }
    
    func phoneNumberValidation (number : String ,validationBody : String  ) -> Bool
    {
        var status : Bool!
        if !number.isEmpty{
            print("\(number.beginWithValue())")
            if number.beginWithValue(){
                
                
                if number.equalLenghtTo(maxNumber: SingletonClass().sharedInstance.phoneNumberLenght){
                    status  =  true
                }
                    
                else {
                    showAlert(message: localizedString(forKey: "phoneNumberStyle", languageType: "ar"), title: "")
                    status  =  false
                    
                }
            }
            else
            {
                showAlert(message: localizedString(forKey: "phoneNumberStyle", languageType: "ar"), title: "")
                status  =  false
            }
            
        }
        else {
            showAlert(message:validationBody, title: "")
            status  =  false
            
        }
        
        return status
        
    }
    
    
    // for hide tool bar while navigation
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func generateButton(buttonImage : String ) -> UIButton {
        let button =  UIButton()
        let image = UIImage(named: buttonImage) as UIImage?
        button.setImage(image, for: .normal)
        return button
    }
    
    //  CHANGE COLOR OF STATUS BAR
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setNavigationBar(shomeHome :Bool , showBack: Bool ) {
        
        print("will setNavigationBar is callled ")
        // create view which   contain  two  button
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                print("iPhone X ")
                 drawHeader(y: 45,shomeHome :shomeHome , showBack: showBack)
                break
            default:
                
                drawHeader(y: 35,shomeHome :shomeHome , showBack: showBack)
            }
        }
        
        
        if UIDevice().userInterfaceIdiom == .pad {
            switch UIScreen.main.nativeBounds.height {
           
            case 2732.0:
                    print("iPhone tttt")
                    drawHeader(y: 60,shomeHome :shomeHome , showBack: showBack)
                break
            default:
                
                drawHeader(y: 50,shomeHome :shomeHome , showBack: showBack)
            }
        }
       
        

    }
    func deviceTypeForMarginTop(marginTop: NSLayoutConstraint!)  {
        // check  device type
        if UIDevice().userInterfaceIdiom == .phone {
            let h = UIScreen.main.nativeBounds.height
            print("iPhone X \(h)")
            switch  h  {
            case 2436:
                print("iPhone X")
                marginTop.constant = 140
                break
            case 1366:
                marginTop.constant = 345
                print("iPhone 1366")
                
                break
            case 1024:
                marginTop.constant = 245
                print("iPhone 1")
                
                break
            case 2732.0:
                print("iPhone 2732.0")
                
                marginTop.constant = 1045
                break
            default:
                marginTop .constant = 145
                
            }
        }
        
        if UIDevice().userInterfaceIdiom == .pad {
            let h = UIScreen.main.nativeBounds.height
            print("iPhone X \(h)")
            switch  h  {
            case 2436:
                print("iPhone X")
                marginTop.constant = 145
                break
            case 1366:
                marginTop.constant = 195
                break
            case 1024:
                marginTop.constant = 195
                break
            case 2732.0:
                print("iPhone 2732.0")
                marginTop.constant = 345
            default:
                marginTop .constant = 165
                
            }
        }
    }
//    func setTabIcons() {
//        
//        print("will setNavigationBar is callled ")
//        // create view which   contain  two  button
//        
//        if UIDevice().userInterfaceIdiom == .phone {
//            switch UIScreen.main.nativeBounds.height {
//            case 2436:
//                print("iPhone X")
//                drawTabBar(y: 45)
//            default:
//                
//                drawTabBar(y: 20)
//            }
//        }
//        
//        
//        
//    }
    
    
    func drawTabBar(y : CGFloat ) {
        let myView  = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height:70))
        
//        //        myView.backgroundColor = UIColor(patternImage: UIImage(named: "header_20")!)
//        let doneButton = generateButton(buttonImage: "home")
//        doneButton.frame =  CGRect(x:20,y:10,width: 50,height:50)
//
//        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
//            myView.addSubview(doneButton)
//
//        // add button
//        let cancelButton =  generateButton(buttonImage: "back")
//        cancelButton.frame =  CGRect(x:self.view.frame.size.width-60,y:10,width: 50,height:50)
//        cancelButton.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
//            myView.addSubview(cancelButton)
//
//
//        let favButton =  generateButton(buttonImage: "fav")
//        favButton.frame =  CGRect(x:120,y:10,width: 50,height:50)
//        favButton.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
//        myView.addSubview(favButton)
//
//
//        let profileButton =  generateButton(buttonImage: "information")
//        profileButton.frame =  CGRect(x:240,y:10,width: 50,height:50)
//        profileButton.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
//        myView.addSubview(profileButton)
//
        
        addButtonToView(buttonImageName: "home", buttonX: 20, ButtonY: 10, containerView: myView)
        addButtonToView(buttonImageName: "setting", buttonX: self.view.frame.size.width-70, ButtonY: 10, containerView: myView)
        addButtonToView(buttonImageName: "star", buttonX: 110, ButtonY: 10, containerView: myView)
        addButtonToView(buttonImageName: "user", buttonX: 210, ButtonY: 10, containerView: myView)
        
        self.navigationController?.navigationBar.isHidden =  true;
        self.navigationController?.navigationBar.isTranslucent = true;
        self.view.addSubview(myView)
    }
    
    
    func addButtonToView(buttonImageName : String ,buttonX : CGFloat,ButtonY : CGFloat,containerView : UIView){
        let button =  generateButton(buttonImage: buttonImageName)
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                print("iPhone X")
                button.frame =  CGRect(x:buttonX,y:-20,width: 50,height:50)
            default:
                button.frame =  CGRect(x:buttonX,y:10,width: 50,height:50)

            }
        }
        switch(buttonImageName){
        case "home":
            button.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
            break
        case "back":
            button.addTarget(self, action: #selector(done), for: .touchUpInside)
            break
        case "fav":
            button.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
            break
        case "information":
            button.addTarget(self, action: #selector(done), for: .touchUpInside)

            break

        default:
            print("switch Defualt")
        }
        
        button.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
        containerView.addSubview(button)
        
    }
    func drawHeader(y : CGFloat ,shomeHome :Bool , showBack: Bool) {
        let myView  = UIView(frame: CGRect(x: 0, y: y, width: self.view.frame.size.width, height:70))
        
//        myView.backgroundColor = UIColor(patternImage: UIImage(named: "header_20")!)
        doneButton = generateButton(buttonImage: "add_fav")
        doneButton.frame =  CGRect(x:20,y:10,width: 40,height:40)

        doneButton.addTarget(self, action:#selector(done), for: .touchUpInside)

        if(shomeHome ==   true){
            myView.addSubview(doneButton)
        }
        let cancelButton =  generateButton(buttonImage: "back")
        cancelButton.frame =  CGRect(x:self.view.frame.size.width-60,y:10,width: 40,height:40)

        cancelButton.addTarget(self, action: #selector(backTohome), for: .touchUpInside)
        if(showBack  ==   true)
        {
            myView.addSubview(cancelButton)
            
        }
        self.navigationController?.navigationBar.isHidden =  true;
        self.navigationController?.navigationBar.isTranslucent = true;
        self.view.addSubview(myView)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

    
    @objc  func backTohome(){
      moveTo(name: readStringValueFromShard(key: "MOVE_TO"))

//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! UserDashBoard
//        let navigationController = UINavigationController(rootViewController: vc)
//        self.present(navigationController, animated: true, completion: nil)
        
    }
    
    @objc func done() {
     //   moveTo(name: "HomeViewController")
        
        let image = UIImage(named: "add_fav") as UIImage?
        doneButton.setImage(image, for: .normal)
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
//                let navigationController = UINavigationController(rootViewController: vc)
//                self.present(navigationController, animated: true, completion: nil)
    }
    
    
    // sring validation 
    func validateStringValue  (checkedValued  : String , emptyValidationMessage :  String ,lenghtValidationMessage :  String ,lenght : Int ) -> Bool
    {
        //var status: Bool!
        if checkedValued.isEmpty {
            showAlert(message: emptyValidationMessage, title: "")
            print("em")
            return false
            
        }
        else{
            if lenght == RECORD_ID_VALIDATION || lenght == PHONE_NUMBER_VALIDATION {
                if checkedValued.count != lenght {
                    print("less than  record or phone \(lenght)")

                    showAlert(message: lenghtValidationMessage, title: "")
                    return false
                    
                    
                }
                else {
                    return  true
                }
            }
            else
            {
                if checkedValued.count > lenght {
                    print("less than \(lenght)")
                    showAlert(message: lenghtValidationMessage, title: "")
                    return false
                }
                else {
                    return  true
                }
                
                }
            
            
            
        }
    }
    
    
    //  Show  alert
    func showAlert(message : String ,title : String ){
        let  popUp =  PopUpDialogViewController()
        popUp.message  =  message
        popUp.height = 130
        popUp.modalPresentationStyle =  .custom
        present(popUp, animated: true, completion: nil)
        
        
//        let alertController = UIAlertController(title: title, message:
//           message, preferredStyle: UIAlertControllerStyle.alert)
//        let cancelAction = UIAlertAction(title: "إلغاء", style: UIAlertActionStyle.cancel) {
//            UIAlertAction in
//            NSLog("Cancel Pressed")
//            self.dismiss(animated: true, completion: nil)
//
//        }
//
//
//        cancelAction.setValue(UIColorFromRGB(rgbValue: 0x033826), forKey: "titleTextColor")
//
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    //  move to  anther controller view
    func moveTo(name: String)  {
        addStringToShar(key: "MOVE_TO", value: name)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: name)
        let navigationController = UINavigationController(rootViewController: vc!)
        self.navigationController?.popViewController(animated: true)
      
        
    }
    
    
    func   tabBarDisActive(type :  Int)   {
        let colorNormal : UIColor = UIColor.white
        let colorSelected : UIColor =  UIColorFromRGB(rgbValue: 0x033826)
        let titleFontAll : UIFont =  UIFont.init(name: "HacenAlgeria", size: 15)!
        let attributesNormal = [
            NSAttributedStringKey.foregroundColor : colorNormal,
            NSAttributedStringKey.font : titleFontAll]
        
        let attributesSelected = [
            NSAttributedStringKey.foregroundColor : colorSelected,
            NSAttributedStringKey.font : titleFontAll ]
        
            if let items = tabBarController?.tabBar.items {
                for i in  0 ... items.count-1 {
                let tabBarItem = items[i]

                if type  == 1{
                tabBarItem.setTitleTextAttributes(attributesSelected, for: [])
                tabBarController?.tabBar.tintColor = UIColorFromRGB(rgbValue: 0x033826)
            }
            else {
                    tabBarItem.setTitleTextAttributes(attributesNormal, for: [])
                    tabBarController?.tabBar.tintColor = UIColor.white
            }
                
                }
                
            }
       
        
    }
    
    func moveTo(name: String,backTo: String)  {
        addStringToShar(key: "MOVE_TO", value: backTo)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: name)
        
        //        let navigationController = UINavigationController(rootViewController: vc!)
        //        navigationController.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
        self.show(vc!, sender: self)
        
        //(navigationController, animated: true, completion: nil)
        
    }
  
    // read data from  Localizable file
   public  func localizedString(forKey key: String ,languageType:  String ) -> String {
        let path = Bundle.main.path(forResource: languageType , ofType: "lproj")
        let bundal  =  Bundle.init(path: path!)! as Bundle
        let result =  bundal.localizedString(forKey: key, value: nil, table: nil)
        return result
    }
    
    //  read data from  shard prefrances
    func readIntegerValueFromShard(key : String ) -> Int {
        let preferences = UserDefaults.standard
        var currentLevel = 0
        let currentLevelKey = key
        if preferences.object(forKey: currentLevelKey) == nil {
            //  Doesn't exist
        } else {
             currentLevel = preferences.integer(forKey: currentLevelKey)
        }
        return currentLevel
        
    }
    func deleteFromPrefrance(key:String ) {
        let prefs = UserDefaults.standard
        prefs.removeObject(forKey: key)

    }
    
    func readStringValueFromShard(key : String ) -> String  {
        let preferences = UserDefaults.standard
        var currentLevel :String!
        if preferences.string(forKey: key) == nil {
         currentLevel = ""
        } else {
            currentLevel = preferences.string(forKey: key)!
        }
        return removeOptional(text: currentLevel)
    }
    
    
    func addStringToShar(key  :  String ,value  :  String!){
        let preferences = UserDefaults.standard
        preferences.set(value!, forKey: key)
        //  Save to disk
        let didSave = preferences.synchronize()
        if !didSave {
            //  Couldn't save (I've never seen this happen in real world testing)
        }
        
    }
    
   func removeOptional(text : String! )->String {
    let newText =  text?.replacingOccurrences(of: "Optional(\"", with: "", options: .literal, range: nil)
    return newText!.replacingOccurrences(of: "\")", with: "", options: .literal, range: nil)
    }
    func removeOptionalDouble(text : String! )->String {
        let newText =  text?.replacingOccurrences(of: "Optional(", with: "", options: .literal, range: nil)
        return newText!.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
    }
    
  
    
    func showLoader(message : String ) {
        
        hud?.textLabel.text = message
        hud?.show(in: self.view)
    }
    func dismissLoader() {
        hud?.dismiss()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // regula document reader
        func initializationReader() {
            //initialize license
            guard let dataPath = Bundle.main.path(forResource: "regula.license", ofType: nil) else { return }
            guard let licenseData = try? Data(contentsOf: URL(fileURLWithPath: dataPath)) else { return }
            print("ttttttttttttt \(licenseData)")
            //create DocReader object
            let docReader = DocReader()
            //set scenario
            docReader.processParams.scenario = "Mrz"
            docReader.initilizeReader(license: licenseData) { (successfull, error) in
                if successfull {
                    print("intial success")
                } else {
                   // self.activityIndicator.stopAnimating()
                    let licenseError = error ?? "Unknown error"
                   // self.initializationLabel.text = "Initialization error: \(licenseError)"
                    print(licenseError)
                }
            }
            
            self.docReader = docReader
            
        }
    
    //  open  camera for regula
    func openCameraForRegula () {
        self.docReader?.processParams.scenario = "Mrz"
        //start recognize
        docReader?.showScanner(self) { (action, result, error) in
            switch action {
            case .cancel:
                print("Cancelled by user")
            case .complete:
                print("Completed")
                self.handleResult(result: result)
            case .error:
                print("Error")
                guard let error = error else { return }
                print("Error string: \(error)")
            case .process:
                guard let result = result else { return }
                print("Scaning not finished. Result: \(result)")
            case .morePagesAvailable:
                print("This status couldn't be here, it uses for -recognizeImage function")
            }
        }
    }
    
    
    
    // select image from  gallery  for regula
    
    func getImageFromGalleryForRegula() {
        PHPhotoLibrary .requestAuthorization { (status) in
            switch status {
            case .authorized:
                if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    self.imagePickerGallery.delegate = self
                    self.imagePickerGallery.sourceType = .photoLibrary;
                    self.imagePickerGallery.allowsEditing = false
                    DispatchQueue.main.async {
                        self.imagePickerGallery.navigationBar.tintColor = .black
                        self.present(self.imagePickerGallery, animated: true, completion: nil)
                    }
                }
            case .denied:
                let message = NSLocalizedString("Application doesn't have permission to use the camera, please change privacy settings", comment: "Alert message when the user has denied access to the gallery")
                let alertController = UIAlertController(title: NSLocalizedString("Gallery Unavailable", comment: "Alert eror title"), message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert manager, OK button tittle"), style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: NSLocalizedString("Settings", comment: "Alert button to open Settings"), style: .default, handler: { action in
                    if #available(iOS 10.0, *) {
                        guard let settingsURL = URL(string: UIApplicationOpenSettingsURLString) else { return }
                        UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
                    }
                }))
                self.present(alertController, animated: true, completion: nil)
                print("PHPhotoLibrary status: denied")
                break
            case .notDetermined:
                print("PHPhotoLibrary status: notDetermined")
            case .restricted:
                print("PHPhotoLibrary status: restricted")
            }
        }
    }
    


    
    // after pick  image
    func handleResult(result: DocumentReaderResults?) {
        guard let result = result else { return }
        SecondStepRegistPassportAndTripDataUIViewController.getRegularValue.getRegularResult(result :  result)
       // SingletonClass().sharedInstance.result =  result
    }
    
}

extension BaseController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        if   SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery == 1{
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.dismiss(animated: true, completion: {
                    
                    //start recognize
                    self.docReader?.recognizeImage(image, completion: { (action, result, error) in
                        if action == .complete {
                            if result != nil {
                                print("Completed")
                                print("Result class: \(result!)")
                                
                                self.handleResult(result: result)
                            } else {
                                print("Completed without result")
                            }
                        } else if action == .error {
                            print("Eror")
                            guard let error = error else { return }
                            print("Eror: \(error)")
                        }
                    })
                    
                })
            } else {
                self.dismiss(animated: true, completion: nil)
                print("Something went wrong")
            }
            
        }
        else {
            SecondStepRegistPassportAndTripDataUIViewController.getRegularValue.getGalleryResult(info : info)

        }
       
    }
}

extension BaseController: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let docReader = docReader else { return 0 }
        return docReader.availableScenarios.count
    }
}

extension BaseController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return docReader?.availableScenarios[row].identifier
}
}

