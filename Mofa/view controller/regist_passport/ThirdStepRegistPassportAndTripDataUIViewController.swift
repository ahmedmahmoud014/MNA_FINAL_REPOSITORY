//
//  ThirdStepRegistPassportAndTripDataUIViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ThirdStepRegistPassportAndTripDataUIViewController: BaseController ,UITextViewDelegate {

    @IBOutlet weak var friendPhone: UITextView!
    @IBOutlet weak var frindName: UITextView!
    @IBOutlet weak var attentionText: UILabel!
    @IBOutlet weak var emailTxtView: UITextView!
    @IBOutlet weak var phoneNumber: UITextView!
    
    var phone :String!
    var email :String!
    var fri_phone :String!
    var fri_name :String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        phone = localizedString(forKey: "phoneNumber", languageType: "ar")
        email = localizedString(forKey: "email", languageType: "ar")
       // fri_phone = localizedString(forKey: "phoneNumber", languageType: "ar")
        fri_name = localizedString(forKey: "fourName", languageType: "ar")
        attentionText.text = localizedString(forKey: "attention", languageType: "ar")
        addPlaceHolder(textView: phoneNumber, textPlace: phone, tag: 0, textDelegate: self)
        addPlaceHolder(textView: emailTxtView,textPlace: email, tag: 1, textDelegate: self)
        addPlaceHolder(textView: frindName,textPlace: fri_name, tag: 3, textDelegate: self)
        addPlaceHolder(textView: friendPhone,textPlace: phone, tag: 4, textDelegate: self)
      //  phoneNumber.centerVertically()


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
        //SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveUp( tag: textView.tag)

        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       // SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveDown()

        if textView.text.isEmpty {
//            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
            case 0 :
                textView.text = localizedString(forKey: "phoneNumber", languageType: "ar")
                
                break;
            case 1 :
                textView.text =  email
                RegistPassportSingletone().sharedInstance.email = ""

                break;
            case 3 :
                textView.text =  fri_name
                RegistPassportSingletone().sharedInstance.friendName = ""

                break;
            case  4 :
                textView.text = localizedString(forKey: "phoneNumber", languageType: "ar")
                RegistPassportSingletone().sharedInstance.friendPhone = ""

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
        case 0,4:
            
            if newText.range(of:"+") != nil {
                print("exists")
                PHONE_NUMBER_VALIDATION =  13
            }else
            {
               PHONE_NUMBER_VALIDATION =  14
            }
            print("ppppppppphone \(PHONE_NUMBER_VALIDATION)")
            status = numberOfChars <= PHONE_NUMBER_VALIDATION
            break
        case 1:
            status = numberOfChars <= 50
            break
        case 3:
            status = numberOfChars <= 80
            break
            
        default:
            break
            
        }
        return status
        
        
    }

    
    func textViewDidChange(_ textView: UITextView) {
        let textViewValue =  textView.text!
        textView.text = textViewValue.stripped

//        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)

      print(textViewValue)
        switch textView.tag {
        case 0 :
            textView.text = textViewValue.strippedPhone
        RegistPassportSingletone().sharedInstance.phoneNumber = textViewValue
            break;
        case 1 :
            textView.text = textViewValue.strippedEmail
        RegistPassportSingletone().sharedInstance.email = textViewValue
            break;
        case 3 :
        RegistPassportSingletone().sharedInstance.friendName = textViewValue
            break;
        case 4 :
            textView.text = textViewValue.strippedPhone
        RegistPassportSingletone().sharedInstance.friendPhone = textViewValue
            break;
            
        default: break
            
        }
        
    }
}
