//
//  FirstStepRequestHelpViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class FirstStepRequestHelpViewController : BaseController ,UITextViewDelegate {
    
    @IBOutlet weak var firstNameTxt: UITextView!
    @IBOutlet weak var fatherNameTx: UITextView!
    @IBOutlet weak var grandFatherNameTx: UITextView!
    @IBOutlet weak var familyNameTx: UITextView!
    @IBOutlet weak var passportIDTxt: UITextView!
    @IBOutlet weak var recodIDTxt: UITextView!
    public static var scrollViewUpDelegate : ScrollViewUpDelegate!

    var firstPlaceHolder :String!
    var fatherPlaceHolder :String!
    var grandFatherPlaceHolder :String!
    var familyPlaceHolder :String!
    var passportIDPlaceHolder :String!
    var recodIDPlaceHolder :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        firstPlaceHolder = localizedString(forKey: "fristName", languageType: "ar")
        fatherPlaceHolder = localizedString(forKey: "fahterName", languageType: "ar")
        grandFatherPlaceHolder = localizedString(forKey: "grandfahterName", languageType: "ar")
        familyPlaceHolder = localizedString(forKey: "familyName", languageType: "ar")
        passportIDPlaceHolder = localizedString(forKey: "passportId", languageType: "ar")
        recodIDPlaceHolder = localizedString(forKey: "recordId", languageType: "ar")
        
        addPlaceHolder(textView: firstNameTxt, textPlace: firstPlaceHolder, tag: 0, textDelegate: self)
        addPlaceHolder(textView: fatherNameTx,textPlace: fatherPlaceHolder, tag: 1, textDelegate: self)
        addPlaceHolder(textView: grandFatherNameTx ,textPlace: grandFatherPlaceHolder, tag: 2, textDelegate: self)
        addPlaceHolder(textView: familyNameTx,textPlace: familyPlaceHolder, tag: 3, textDelegate: self)
        addPlaceHolder(textView: passportIDTxt,textPlace: passportIDPlaceHolder, tag: 4, textDelegate: self)
        addPlaceHolder(textView: recodIDTxt,textPlace: recodIDPlaceHolder, tag: 5, textDelegate: self)
        
        
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
        //6FirstStepRequestHelpViewController.scrollViewUpDelegate.moveDown()

        if textView.text.isEmpty {
//            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
            case 0 :
                textView.text = firstPlaceHolder
                RequestHelpSingleTone().sharedInstance.firstname = ""
                
                break;
            case 1 :
                textView.text =  fatherPlaceHolder
                RequestHelpSingleTone().sharedInstance.fathername = ""

                break;
            case 2 :
                textView.text =  grandFatherPlaceHolder
                RequestHelpSingleTone().sharedInstance.grandFahterName = ""

                
                break;
            case 3 :
                textView.text = familyPlaceHolder
                RequestHelpSingleTone().sharedInstance.familyName = ""

                break;
            case 4 :
                textView.text =  passportIDPlaceHolder
                RequestHelpSingleTone().sharedInstance.passportId = ""

                break;
            case 5 :
                textView.text =  recodIDPlaceHolder
                RequestHelpSingleTone().sharedInstance.recordId = ""

    
                break;
                
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        }
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let textViewValue =  textView.text!
//        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)

        switch textView.tag {
            
        case 0 :
                RequestHelpSingleTone().sharedInstance.firstname = textViewValue
           
            break;
        case 1 :
               RequestHelpSingleTone().sharedInstance.fathername = textViewValue
            
            break;
        case 2 :
               RequestHelpSingleTone().sharedInstance.grandFahterName = textViewValue
            break;
        case 3 :
                RequestHelpSingleTone().sharedInstance.familyName = textViewValue
            
            break;
        case 4:
            RequestHelpSingleTone().sharedInstance.passportId =  textViewValue
            break
        case 5:
            RequestHelpSingleTone().sharedInstance.recordId =  textViewValue
            break

            
        default: break
            
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var status =  true
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
        case 0,1,2,3:
            status = numberOfChars <= 20
        case 5:
            status = numberOfChars <= RECORD_ID_VALIDATION
        case 4:
            status = numberOfChars <= PASSPORT_NUMBER_VALIDATION
        
        default:
            break
            
        }
        return status
        
        
    }
}

