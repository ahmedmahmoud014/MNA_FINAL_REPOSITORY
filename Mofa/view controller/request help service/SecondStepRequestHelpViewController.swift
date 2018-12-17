//
//  SecondStepRequestHelpViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class SecondStepRequestHelpViewController:BaseController ,UITextViewDelegate,PopUPDelegate{
    func selectedItem(itemValue: Int,tag :Int) {
        print("index \(itemValue)")
        let value  = SingletonClass().sharedInstance.allItems[itemValue].title
        if tag ==  1
        {
            RequestHelpSingleTone().sharedInstance.representation = 1
            SingletonClass().sharedInstance.travelType = itemValue
            representationTypBtn.setTitle("", for: .normal)
            representationTypBtn.setTitleColor(UIColor.black, for: .normal)
            representationTypBtn.setTitle(value, for: .normal)
            
        }else {
            RequestHelpSingleTone().sharedInstance.country = 1
            SingletonClass().sharedInstance.countryValue = itemValue
            countryTypBtn.setTitle("", for: .normal)
            countryTypBtn.setTitleColor(UIColor.black, for: .normal)
            countryTypBtn.setTitle(value, for: .normal)
        }
    }
    
    
    @IBAction func representationAction(_ sender: UIButton) {
        showPopup(tag: 1)
    }
    
    @IBAction func countryTypAction(_ sender: UIButton) {
        showPopup(tag: 2)
    }
    
    @IBOutlet weak var phoneNumberTXt: UITextView!
    @IBOutlet weak var emailTxt: UITextView!
    @IBOutlet weak var countryTypBtn: UIButton!
    @IBOutlet weak var cityTxt: UITextView!
    @IBOutlet weak var representationTypBtn: UIButton!
    @IBOutlet weak var addressTxt: UITextView!
    
    
    var phoneNumberPlaceHolder : String!
    var emailPlaceHolder : String!
    var countryTypPlaceHolder : String!
    var cityPlaceHolder : String!
    var representationPlaceHolder : String!
    var addressPlaceHolder : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        phoneNumberPlaceHolder = localizedString(forKey: "phoneNumber", languageType: "ar")
        emailPlaceHolder = localizedString(forKey: "email", languageType: "ar")
        countryTypPlaceHolder = localizedString(forKey: "countryGoto", languageType: "ar")
        cityPlaceHolder = localizedString(forKey: "cityGoto", languageType: "ar")
        representationPlaceHolder = localizedString(forKey: "representation", languageType: "ar")
        addressPlaceHolder = localizedString(forKey: "addressInCountry", languageType: "ar")
        representationTypBtn.setTitle(representationPlaceHolder, for: .normal)
        countryTypBtn.setTitle(countryTypPlaceHolder, for: .normal)
        //        addPlaceHolder(textView: travellingTypeTXt, textPlace: travelTextPlaceHolder, tag: 0)
        //        addPlaceHolder(textView: countryGoToTxt,textPlace: countryGoToTextPlaceHolder, tag: 1)
        addPlaceHolder(textView: phoneNumberTXt,textPlace: phoneNumberPlaceHolder, tag: 0, textDelegate: self)
        addPlaceHolder(textView: emailTxt,textPlace: emailPlaceHolder, tag: 1, textDelegate: self)
        addPlaceHolder(textView: cityTxt,textPlace: cityPlaceHolder, tag: 4, textDelegate: self)
        addPlaceHolder(textView: addressTxt,textPlace: addressPlaceHolder, tag: 5, textDelegate: self)
        
        representationTypBtn.addShadow(roundBorder: 20, opacity: 0.1)
        countryTypBtn.addShadow(roundBorder: 20, opacity: 0.1)
        representationTypBtn.titleLabel?.textColor = UIColor.gray
        countryTypBtn.titleLabel?.textColor = UIColor.gray
        
       


        
        
        
    }
    
  
    
    func showPopup(tag : Int ){
        
        PopUPViewController.popUPDelegate = self
        PopUPViewController.tag = tag
        if tag == 1 {
            
            SingletonClass().sharedInstance.allItems.removeAll()
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "القاهره"))
                SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "عمان"))
                SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "دبي"))
                SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "أبوظبي"))
            
            PopUPViewController.selectedValue   = SingletonClass().sharedInstance.travelType
        }
        else {
            SingletonClass().sharedInstance.allItems.removeAll()
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "مصر "))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "عمان"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "الادرن"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "اليابان"))
            
            
            PopUPViewController.selectedValue   = SingletonClass().sharedInstance.countryValue
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUPViewController")
        vc?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(vc!, animated: true)
        
        
        //        let vc = PopUPViewController(nibName: "PopUPViewController", bundle: nil)
        //        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //        present(vc, animated: true)
    }
    
    
//    func  addPlaceHolder (textView : UITextView,textPlace : String ,tag : Int ){
//        textView.delegate = self
//        textView.tag  = tag
//        textView.text = textPlace
//        textView.textColor = UIColor.lightGray
//        textView.addShadow(roundBorder: 20, opacity: 0.1)
//        textView.font   = UIFont.init(name: "HacenAlgeria", size: 20)!
//        textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)
//
//    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
       // FirstStepRequestHelpViewController.scrollViewUpDelegate.moveUp( tag: textView.tag)

        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
      //  FirstStepRequestHelpViewController.scrollViewUpDelegate.moveDown()


        if textView.text.isEmpty {
//            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
            case 0  :
                textView.text = phoneNumberPlaceHolder
                
                break;
            case 1 :
                textView.text =  emailPlaceHolder
                break;
            case 4 :
                textView.text =  cityPlaceHolder
            case 5 :
                textView.text =  addressPlaceHolder
                break;
           
                
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        }

    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var status =  true
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
        case 0:
            if newText.range(of:"+") != nil {
                print("exists")
                PHONE_NUMBER_VALIDATION =  13
            }else
            {
                PHONE_NUMBER_VALIDATION =  14
            }
            
            status = numberOfChars <= PHONE_NUMBER_VALIDATION
            break
        case 1 ,4:
            status = numberOfChars <= 50
            break
        case 5:
            status = numberOfChars <= 100
            break
        default:
            break
            
        }
        return status
        
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
//        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)

        
        let textViewValue =  textView.text!
        textView.text = textViewValue.stripped

        switch textView.tag {
        case 0 :
            textView.text = textViewValue.strippedPhone
            RequestHelpSingleTone().sharedInstance.phoneNumber = textViewValue
            break;
        case 1 :
            textView.text = textViewValue.strippedEmail
               RequestHelpSingleTone().sharedInstance.email = textViewValue
            break;
        case 4 :
                RequestHelpSingleTone().sharedInstance.city = textViewValue
            break;
        case 5 :
            textView.text = textViewValue.strippedAddress
                RequestHelpSingleTone().sharedInstance.address = textViewValue
            break;
            
        default: break
            
        }
    }
    
    
    
}
