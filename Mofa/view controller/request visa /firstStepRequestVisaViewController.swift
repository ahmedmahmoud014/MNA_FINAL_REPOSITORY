//
//  firstStepRequestVisaViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class firstStepRequestVisaViewController: BaseController ,UITextViewDelegate {
    
    
    @IBOutlet weak var recodIDTxt: UITextView!
    @IBOutlet weak var passportIDTxt: UITextView!
    @IBOutlet weak var arabicBirthDateTxt: UITextView!
    @IBOutlet weak var phoneNumberTxt: UITextView!
    @IBOutlet weak var nameTxt: UITextView!
    
    var datePicker = UIDatePicker()
   
    
    //public static var scrollViewUpDelegate : ScrollViewUpDelegate!

    
    var recodIDPlaceHolder :String!
    var passportIDPlaceHolder :String!
    var phoneNumberPlaceHolder :String!
    var arabicBirthDatePlaceHolder :String!
    var namePlaceHolder :String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    
        passportIDPlaceHolder = localizedString(forKey: "passportId", languageType: "ar")
        recodIDPlaceHolder = localizedString(forKey: "recordId", languageType: "ar")
        arabicBirthDatePlaceHolder = localizedString(forKey: "birthDate", languageType: "ar")
        phoneNumberPlaceHolder = localizedString(forKey: "phoneNumber", languageType: "ar")
        namePlaceHolder = localizedString(forKey: "fourName", languageType: "ar")

        addPlaceHolder(textView: nameTxt,textPlace: namePlaceHolder, tag: 0, textDelegate: self)
        addPlaceHolder(textView: recodIDTxt,textPlace: recodIDPlaceHolder, tag: 1, textDelegate: self)
        addPlaceHolder(textView: passportIDTxt,textPlace: passportIDPlaceHolder, tag: 2, textDelegate: self)
        addPlaceHolder(textView: arabicBirthDateTxt, textPlace: arabicBirthDatePlaceHolder, tag: 3, textDelegate: self)
        addPlaceHolder(textView: phoneNumberTxt,textPlace: phoneNumberPlaceHolder, tag: 4, textDelegate: self)
        
        datePicker = UIDatePicker() 
        datePicker.datePickerMode = .date
        arabicBirthDateTxt.inputView = datePicker
        datePicker.addTarget(self, action: #selector(self.datePickerChanged), for: UIControlEvents.valueChanged)
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(self.datePickerChanged), cancelSelector: #selector(self.dismissPicker))
        arabicBirthDateTxt.inputAccessoryView = toolBar
        
        
    }
    
    func compareDate() -> Bool  {
        //firstStepRequestVisaViewController.scrollViewUpDelegate.moveUp( tag: 3)

        let currentDate = Date()
        let birthDate  = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  DATE_FORMATE
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
            arabicBirthDateTxt.textColor = UIColor.black
            arabicBirthDateTxt.text = dateValue
            RequestVisaSingleTone().sharedInstance.birthdate = dateValue
            
            return false
            
            
        }
    }
    
    
    @objc func datePickerChanged() {
    
        if compareDate(){
            showAlert(message: localizedString(forKey: "birthDateVidation", languageType: "ar"), title: "")
        }
        
    }
    
    @objc func dismissPicker() {
       // firstStepRequestVisaViewController.scrollViewUpDelegate.moveDown()

        view.endEditing(true)
        
    }
//
//    func  addPlaceHolder (textView : UITextView,textPlace : String ,tag : Int ){
//        textView.delegate = self
//        textView.tag  = tag
//        textView.text = textPlace
//        textView.textColor = UIColor.lightGray
//        textView.addShadow(roundBorder: 20, opacity: 0.1)
//        textView.font   = UIFont.init(name: "HacenAlgeria", size: 20)!
//        textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)
//    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
       // firstStepRequestVisaViewController.scrollViewUpDelegate.moveUp( tag: textView.tag)
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var status =  true

        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
        case 0:
            status = numberOfChars <= 80
            break
        case 1:
            status = numberOfChars <= RECORD_ID_VALIDATION
            break
        case 2:
            status = numberOfChars <= PASSPORT_NUMBER_VALIDATION
            break

        case 4:
            if newText.range(of:"+") != nil {
                print("exists")
                PHONE_NUMBER_VALIDATION =  13
            }else
            {
                PHONE_NUMBER_VALIDATION =  14
            }
            status = numberOfChars <= PHONE_NUMBER_VALIDATION
            break

        default:
            break

        }
        return status
        

    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
      //  firstStepRequestVisaViewController.scrollViewUpDelegate.moveDown()

        if textView.text.isEmpty {
//            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
            
            case 0 :
                textView.text =  namePlaceHolder
                RequestVisaSingleTone().sharedInstance.name = ""

                break;
            case 1 :
                textView.text =  recodIDPlaceHolder
                RequestVisaSingleTone().sharedInstance.recordId = ""
                
                break;
            case 2 :
                textView.text =  passportIDPlaceHolder
                RequestVisaSingleTone().sharedInstance.passportId = ""
                break;
            case 3 :
                textView.text = arabicBirthDatePlaceHolder
                RequestVisaSingleTone().sharedInstance.birthdate = ""
                
              
                break;
            case 4 :
                textView.text =  phoneNumberPlaceHolder
                RequestVisaSingleTone().sharedInstance.phoneNumber = ""
                RequestVisaSingleTone().sharedInstance.verfiyCode = ""
                break;
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        }
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let textViewValue =  textView.text!
//        textView.textContainerInset = UIEdgeInsetsMake(7, 5, 5, 5)

        switch textView.tag {
        case 0 :
         textView.isScrollEnabled  =  true
                RequestVisaSingleTone().sharedInstance.name = textViewValue
            break;
        case 1 :
                RequestVisaSingleTone().sharedInstance.recordId  = textViewValue
//
           
            break;
        
        case 2 :
                RequestVisaSingleTone().sharedInstance.passportId = textViewValue


            break;
            
        case 4 :
            RequestVisaSingleTone().sharedInstance.phoneNumber =  textViewValue
            RequestVisaSingleTone().sharedInstance.verfiyCode = ""
//
            
          
            break;
            
        default: break
            
        }
        
    }
}


