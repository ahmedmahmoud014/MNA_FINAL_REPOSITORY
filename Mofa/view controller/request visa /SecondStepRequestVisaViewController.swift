//
//  SecondStepRequestVisaViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class SecondStepRequestVisaViewController: BaseController ,UITextViewDelegate,PopUPDelegate{
    
    
    
    @IBAction func representationTypeAction(_ sender: UIButton) {
        showPopup(tag: 1)
    }
    
    @IBAction func countryTypAction(_ sender: UIButton) {
        showPopup(tag: 2)
    }
    
    
    
    @IBOutlet weak var emailTxt: UITextView!
    
    @IBOutlet weak var countryTypBtn: UIButton!
    
    @IBOutlet weak var cityGotoTxt: UITextView!
    
    @IBOutlet weak var representationTypBtn: UIButton!
    @IBOutlet weak var detailsTxt: UITextView!


    
    //public static var scrollViewUpDelegate : ScrollViewUpDelegate!


    var emailTextPlaceHolder : String!
    var countryTextPlaceHolder : String!
    var cityTextPlaceHolder : String!
    var representationTTextPlaceHolder : String!
    var detailsTextPlaceHolder : String!
    //var phoneNumber : String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextPlaceHolder = localizedString(forKey: "email", languageType: "ar")
        countryTextPlaceHolder = localizedString(forKey: "countryGoto", languageType: "ar")
        cityTextPlaceHolder = localizedString(forKey: "cityGoto", languageType: "ar")
        representationTTextPlaceHolder = localizedString(forKey: "representation", languageType: "ar")
        detailsTextPlaceHolder = localizedString(forKey: "addressInCountry", languageType: "ar")
        representationTypBtn.setTitle(representationTTextPlaceHolder, for: .normal)
        countryTypBtn.setTitle(countryTextPlaceHolder, for: .normal)
        
        addPlaceHolder(textView: emailTxt,textPlace: emailTextPlaceHolder, tag: 3, textDelegate: self)
        addPlaceHolder(textView: cityGotoTxt,textPlace: cityTextPlaceHolder, tag: 4, textDelegate: self)
        addPlaceHolder(textView: detailsTxt,textPlace: detailsTextPlaceHolder, tag: 5, textDelegate: self)
     
        representationTypBtn.addShadow(roundBorder: 20, opacity: 0.1)
        countryTypBtn.addShadow(roundBorder: 20, opacity: 0.1)
        //representationTypBtn.titleLabel?.textColor = UIColor.gray
       // countryTypBtn.titleLabel?.textColor = UIColor.gray
        
        
       
        
        
    }
   
    
   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var status =  true
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
     
            
        case 3:
            status = numberOfChars <= 50
            break
        default:
            break
            
        }
        return status
    }
    
    func showPopup(tag : Int ){
        
        PopUPViewController.popUPDelegate = self
        PopUPViewController.tag = tag
        if tag == 1 {
            SingletonClass().sharedInstance.allItems.removeAll()
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "القاهره"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "عمان"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "دبي"))
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
        if (textView.tag  !=  3)
        {
       // firstStepRequestVisaViewController.scrollViewUpDelegate.moveUp( tag: textView.tag)
        }
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //firstStepRequestVisaViewController.scrollViewUpDelegate.moveDown()

        if textView.text.isEmpty {
//            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
                
                            
           case 3 :
            textView.text =  emailTextPlaceHolder
            RequestVisaSingleTone().sharedInstance.email =  ""

                            break;
            case 4 :
                textView.text =  cityTextPlaceHolder
                RequestVisaSingleTone().sharedInstance.city =  ""

            case 5 :

                textView.text =  detailsTextPlaceHolder
                RequestVisaSingleTone().sharedInstance.details =  ""

                break;
            
                
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        
        } else {

            let textViewValue =  textView.text!
            switch textView.tag {

//            case 0 :
//
//                    RequestVisaSingleTone().sharedInstance.verfiyCode = ""
//
//
//                break
            case 3 :
                   RequestVisaSingleTone().sharedInstance.email  = textViewValue
               

                break;


            default: break

            }
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
//        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)
        

        let textViewValue =  textView.text!

        switch textView.tag {
        case 3 :
            textView.text = textViewValue.strippedEmail
            if (textViewValue.maxLenght(maxNumber: 51)){
                RequestVisaSingleTone().sharedInstance.email = textViewValue
            }
            else {
                textView.text =   RequestVisaSingleTone().sharedInstance.email

            }
                break;
        case 4 :
            if (textViewValue.maxLenght(maxNumber: 51)){
               RequestVisaSingleTone().sharedInstance.city = textViewValue
            }else {
                textView.text =   RequestVisaSingleTone().sharedInstance.city
                
            }
            break;
        case 5 :
                        textView.textContainerInset = UIEdgeInsetsMake(10, 5, 5, 5)

                        if (textViewValue.maxLenght(maxNumber: 101)){
                           RequestVisaSingleTone().sharedInstance.details = textViewValue
                        }else {
                            textView.text = RequestVisaSingleTone().sharedInstance.details
            
                        }
                        break;
            
            
        default: break
            
        }
    }
   
    
    func selectedItem(itemValue: Int,tag :Int) {
        print("index \(itemValue)")
        let value  = SingletonClass().sharedInstance.allItems[itemValue].title
        if tag ==  1
        {
           RequestVisaSingleTone().sharedInstance.representation = 1
            SingletonClass().sharedInstance.travelType = itemValue
           // representationTypBtn.setTitle("", for: .normal)
           representationTypBtn.setTitleColor(UIColor.black, for: .normal)
           // representationTypBtn.titleLabel?.textColor = UIColor.black
            representationTypBtn.setTitle(value, for: .normal)
            
        }
        else {
             RequestVisaSingleTone().sharedInstance.country = 1
            SingletonClass().sharedInstance.countryValue = itemValue
            countryTypBtn.setTitle("", for: .normal)
            countryTypBtn.setTitleColor(UIColor.black, for: .normal)
            countryTypBtn.setTitle(value, for: .normal)
        }
    }
    
    
}

