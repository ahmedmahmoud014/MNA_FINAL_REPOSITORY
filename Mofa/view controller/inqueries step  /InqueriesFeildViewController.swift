//
//  InqueriesFeildViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-29.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class InqueriesFeildViewController: BaseController,  UITextViewDelegate {
    

    @IBOutlet weak var showInfoBtn: UIButton!
    @IBOutlet weak var showInfo2Btn: UIButton!
    @IBOutlet weak var PageTitleView: UIView!
    @IBOutlet weak var pageViewTitle: UILabel!
    @IBOutlet weak var recordNumber: UITextView!
    @IBOutlet weak var visaNumber: UITextView!
    
    @IBOutlet weak var pickDateTextView: UITextView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var loadDataBtn: UIButton!
    var recodIDPlaceHolder :String!
    var visaIdPlaceHolder :String!
    var validatinLengthFristFeild  : Int!
    var validatinLengthSecondFeild : Int!
    
    var datePicker = UIDatePicker()

     lazy  var  datePlaceHolder  =   ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadDataBtn.titleLabel?.font =  UIFont(name: "HacenAlgeria", size: 23)
        loadDataBtn.setTitle(localizedString(forKey: "queryTitle", languageType: "ar"), for: .normal)
        intialize(checkNumber: InquerySingleTone().sharedInstance.selectStep)
        pageViewTitle.text   = InquerySingleTone().sharedInstance.pageTilte
        
        // Do any additional setup after loading the view.
        
    }
    
    func keyBoardType (upperFeild : UIKeyboardType  , dwonFeild : UIKeyboardType ) {
        
        recordNumber.keyboardType = upperFeild
        visaNumber.keyboardType =  dwonFeild
    }
    func intialize(checkNumber :  Int ){
    
         InquerySingleTone().sharedInstance.firstFeildValue = ""
        InquerySingleTone().sharedInstance.secondFeildValue = ""
        InquerySingleTone().sharedInstance.DateValue =   ""

        // use this for show and hide feild which  will appear in  query feild screen
        switch checkNumber {
        case 1:
            showInfo2Btn.isHidden = true
            recodIDPlaceHolder = localizedString(forKey: "recordOrResidenceId", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "requestNumber", languageType: "ar")
            validatinLengthFristFeild  = RECORD_ID_VALIDATION
            validatinLengthSecondFeild  =  VALIDATION_NUMBER_15
            keyBoardType(upperFeild: .numberPad,dwonFeild: .numberPad)
            
            break
        case 2 :
            showInfo2Btn.isHidden = true
            recodIDPlaceHolder = localizedString(forKey: "recordOrResidenceId", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "reqestVisaNumber", languageType: "ar")
            validatinLengthFristFeild  = RECORD_ID_VALIDATION
            validatinLengthSecondFeild  =  RECORD_ID_VALIDATION

            keyBoardType(upperFeild: .numberPad,dwonFeild: .numberPad)

              break
            
        case 3 :
            
            keyBoardType(upperFeild: .numberPad,dwonFeild: .default)

            showInfoBtn.isHidden = true
            showInfo2Btn.isHidden = true
            recodIDPlaceHolder = localizedString(forKey: "reqestVisaRecordNumber", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "passportNumberr", languageType: "ar")
            datePlaceHolder = localizedString(forKey: "birthDate", languageType: "ar")
            addPlaceHolder(textView: pickDateTextView, textPlace: datePlaceHolder, tag: 3, textDelegate: self)
           // pickDateTextView.textColor =  UIColor.gray
            pickDateTextView.isHidden =  false
            pickDateTextView.addShadow(roundBorder: 20, opacity: 0.1)
            validatinLengthFristFeild  = RECORD_ID_VALIDATION
            validatinLengthSecondFeild  =  PASSPORT_NUMBER_VALIDATION
            
            
            datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            pickDateTextView.inputView = datePicker
            datePicker.addTarget(self, action: #selector(self.pickDateValue), for: UIControlEvents.valueChanged)
            let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(self.pickDateValue), cancelSelector: #selector(self.dismissPicker))
            pickDateTextView.inputAccessoryView = toolBar


            break
            
        case 4 :
            
            keyBoardType(upperFeild: .numberPad,dwonFeild: .numberPad)

            showInfoBtn.isHidden = true
            showInfo2Btn.isHidden = true

            recodIDPlaceHolder = localizedString(forKey: "invitationNumber", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "invitationRecordNumber", languageType: "ar")
            validatinLengthFristFeild  = VALIDATION_NUMBER_15
            validatinLengthSecondFeild  =  RECORD_ID_VALIDATION
             break
            
        case 5 :
            
            keyBoardType(upperFeild: .default,dwonFeild: .default)

            showInfoBtn.isHidden = true
            showInfo2Btn.isHidden = true

            recodIDPlaceHolder = localizedString(forKey: "requestNumber", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "passportId", languageType: "ar")
            validatinLengthFristFeild  = VALIDATION_NUMBER_15
            validatinLengthSecondFeild  =  PASSPORT_NUMBER_VALIDATION
            break
            
        case 6 :
            
            keyBoardType(upperFeild: .default,dwonFeild: .default)

            showInfoBtn.isHidden = true
            showInfo2Btn.isHidden = false
            recodIDPlaceHolder = localizedString(forKey: "requestNumber", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "recordNumberORPassport", languageType: "ar")
            validatinLengthFristFeild  = VALIDATION_NUMBER_15
            validatinLengthSecondFeild  =  RECORD_ID_VALIDATION
            break
        case 7 :
            
            keyBoardType(upperFeild: .default,dwonFeild: .numberPad)

            showInfoBtn.isHidden = true
            showInfo2Btn.isHidden = true
            
            recodIDPlaceHolder = localizedString(forKey: "requestNumber", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "reqestVisaRecordNumber", languageType: "ar")
            validatinLengthFristFeild  = VALIDATION_NUMBER_15
            validatinLengthSecondFeild  =  RECORD_ID_VALIDATION
            break
            
        case 8 :
            keyBoardType(upperFeild: .default,dwonFeild: .default)

            showInfoBtn.isHidden = true
            showInfo2Btn.isHidden = true
            
            recodIDPlaceHolder = localizedString(forKey: "requestNumber", languageType: "ar")
            visaIdPlaceHolder = localizedString(forKey: "passportNumberr", languageType: "ar")
            validatinLengthFristFeild  = VALIDATION_NUMBER_15
            validatinLengthSecondFeild  =  PASSPORT_NUMBER_VALIDATION
            break
        default:
          break
        }
        
        
        addPlaceHolder(textView: recordNumber,textPlace: recodIDPlaceHolder, tag: 0, textDelegate: self)
        addPlaceHolder(textView: visaNumber,textPlace: visaIdPlaceHolder, tag: 1, textDelegate: self)
        
       visaNumber.addShadow(roundBorder: 20, opacity:0.2)
        recordNumber.addShadow(roundBorder: 20, opacity:0.2)
        loadDataBtn.addShadow(roundBorder: 20, opacity:0.2)
        loadDataBtn.setImage(UIImage(named: "arrow_left.png"), for: .normal)
       loadDataBtn.imageInButtonLeft(position: .left, imageEdgeSet: UIEdgeInsetsMake(0, 20 , 0, 0))
        PageTitleView.addShadow(roundBorder: 20, opacity:0.2)
        deviceTypeForMarginTop(marginTop: topConstraint)
        setNavigationBar(shomeHome: true, showBack: true)
        tabBarDisActive(type: 1)
        
//        recordNumber.contentInset = UIEdgeInsetsMake(0, 25, 0, 0)
//        visaNumber.contentInset = UIEdgeInsetsMake(0, 25, 0, 0)



    }
    

    
    // Swift 4
    @objc func dismissPicker() {
        
        view.endEditing(true)
        
    }
    
    @objc func pickDateValue () {
        if compareDate(){
            showAlert(message: localizedString(forKey: "birthDateVidation", languageType: "ar"), title: "")
        }
     
    }
    
    
    func compareDate() -> Bool  {
        let currentDate = Date()
        let birthDate  = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateValue = dateFormatter.string(from: datePicker.date)
        let currentValue = dateFormatter.string(from: currentDate)
        
        if birthDate > currentDate
        {
            return true
        }
        else if  dateValue == currentValue {
            return true
        }
        else
        {
            pickDateTextView.textColor = UIColor.black
            pickDateTextView.text = dateValue
            InquerySingleTone().sharedInstance.DateValue = dateValue
           // view.endEditing(true)

            
            return false
            
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
      
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
            textView.contentInset = UIEdgeInsetsMake(0, 25, 0, 0)

            switch textView.tag {
            case 0 :
                InquerySingleTone().sharedInstance.firstFeildValue = ""
                break;
            case 1 :
                InquerySingleTone().sharedInstance.secondFeildValue = ""
                break;
            default: break
                
            }
            
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
            switch textView.tag {

            case 0 :
                textView.text = recodIDPlaceHolder
                InquerySingleTone().sharedInstance.firstFeildValue = ""
                break;
            case 1 :
                textView.text = visaIdPlaceHolder
                InquerySingleTone().sharedInstance.secondFeildValue = ""

                break;
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        }else {
            textView.contentInset = UIEdgeInsetsMake(0, 25, 0, 0)
            switch textView.tag {
            case 0 :
                InquerySingleTone().sharedInstance.firstFeildValue = textView.text!
                print(InquerySingleTone().sharedInstance.firstFeildValue)
                break;
            case 1 :
                InquerySingleTone().sharedInstance.secondFeildValue = textView.text!
                
                break;
            default: break
                
            }
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        //print("tttttttttttpast \(text)")
        
        var status =  true
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
        case 0:
            status = numberOfChars <= validatinLengthFristFeild
            break
        case 1:
            status = numberOfChars <=  validatinLengthSecondFeild

            break
            
        default:
            break
            
        }
        
        return status
        
        
    }

    @IBAction func showInFormation(_ sender: UIButton) {
        
        
        //print("test action  ")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUPInfoViewController") as! PopUPInfoViewController
        
        if InquerySingleTone().sharedInstance.selectStep ==  1 || InquerySingleTone().sharedInstance.selectStep == 2
        {
        vc.messageValue =  "حقل إدخال لرقم السجل المدني او الإقامة أو رقم سجل الحاسب الخاص بالمنشأة صاحبة الطلب"
            vc.viewHeightValue = 200

        }
        else {
            vc.viewHeightValue = 150

             vc.messageValue =  "حقل إدخال لرقم السجل المدني او رقم  جواز السفر "
        }
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(vc, animated: true)

    }
    
    
   
    
   
    @IBAction func loadDataFromApi(_ sender: Any) {
        
        if(Connectivity.isConnectedToInternet )
        {
            
            switch InquerySingleTone().sharedInstance.selectStep {
            case 1 , 2 , 4:
                
               
                if   validateStringValue(checkedValued: InquerySingleTone().sharedInstance.firstFeildValue,emptyValidationMessage: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  recodIDPlaceHolder )",lenghtValidationMessage: " \(recodIDPlaceHolder! + " يجب ان يكون مكون من " + String(validatinLengthFristFeild!) + "رقم" ) ", lenght: validatinLengthFristFeild){
                    if validateStringValue(checkedValued: InquerySingleTone().sharedInstance.secondFeildValue,emptyValidationMessage: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  visaIdPlaceHolder )",lenghtValidationMessage: " \(visaIdPlaceHolder! + " يجب ان يكون مكون من " + String(validatinLengthSecondFeild!) + "رقم" ) ", lenght: validatinLengthSecondFeild){
                        
                        moveTo(name: "InqueriesDataViewController",backTo: "InqueriesFeildViewController")
                    }

                }
                
                
                break
            case 3,5 , 6 , 7 ,8:
                
                
                
                if InquerySingleTone().sharedInstance.selectStep == 5 || InquerySingleTone().sharedInstance.selectStep == 6 || InquerySingleTone().sharedInstance.selectStep == 7 || InquerySingleTone().sharedInstance.selectStep == 8 {
                    InqueriesTopDataViewController.allData =   MainInqueriesViewModel().assignDateToView(screenNumber: InquerySingleTone().sharedInstance.selectStep).allInQuertItems
                    InqueriesTopDataViewController.showTopView = 1
                    if   validateStringValue(checkedValued: InquerySingleTone().sharedInstance.firstFeildValue,emptyValidationMessage: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  recodIDPlaceHolder )",lenghtValidationMessage: " \(recodIDPlaceHolder! + " يجب ان يكون مكون من " + String(validatinLengthFristFeild!) + "رقم" ) ", lenght: validatinLengthFristFeild){
                        if validateStringValue(checkedValued: InquerySingleTone().sharedInstance.secondFeildValue,emptyValidationMessage: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  visaIdPlaceHolder )",lenghtValidationMessage: " \(visaIdPlaceHolder! + " يجب ان يكون مكون من " + String(validatinLengthSecondFeild!) + "رقم" ) ", lenght: validatinLengthSecondFeild){
                            
                            moveTo(name: "InqueriesTopDataViewController",backTo: "InqueriesFeildViewController")
                        }
                        
                    }
                    
                }
                
                else {
                    //load date for third step 
                    InqueriesTopDataViewController.allData =   MainInqueriesViewModel().getQuertForThirdStep()
                    
                    InqueriesTopDataViewController.showTopView = 2
                    if   validateStringValue(checkedValued: InquerySingleTone().sharedInstance.firstFeildValue,emptyValidationMessage: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  recodIDPlaceHolder )",lenghtValidationMessage: " \(recodIDPlaceHolder! + " يجب ان يكون مكون من " + String(validatinLengthFristFeild!) + "رقم" ) ", lenght: validatinLengthFristFeild){
                        if validateStringValue(checkedValued: InquerySingleTone().sharedInstance.secondFeildValue,emptyValidationMessage: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  visaIdPlaceHolder )",lenghtValidationMessage: " \(visaIdPlaceHolder! + " يجب ان يكون مكون من " + String(validatinLengthSecondFeild!) + "رقم" ) ", lenght: validatinLengthSecondFeild){
                            
                            InquerySingleTone().sharedInstance.testThirdStep =  recordNumber.text!

                            if pickDateTextView.isHidden
                            {
                                moveTo(name: "InqueriesTopDataViewController",backTo: "InqueriesFeildViewController")
                            }
                            else {
                                if InquerySingleTone().sharedInstance.DateValue.isEmpty
                                {
                                    showAlert(message: "\( localizedString(forKey: "feildValidation", languageType: "ar") + " " +  datePlaceHolder )", title: "")
                                }
                                else {
                                    
                                    moveTo(name: "InqueriesTopDataViewController",backTo: "InqueriesFeildViewController")
                                    
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
        else{
            showAlert(message:localizedString(forKey: "internet_connection", languageType: "ar"), title: "")
            
        }
    }
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//        addPlaceHolder(textView: recordNumber,textPlace: recodIDPlaceHolder, tag: 0, textDelegate: self)
//        addPlaceHolder(textView: visaNumber,textPlace: visaIdPlaceHolder, tag: 1, textDelegate: self)
//        if pickDateTextView.isHidden {
//            addPlaceHolder(textView: pickDateTextView, textPlace: datePlaceHolder, tag: 3, textDelegate: self)
//
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
