//
//  VerifyStepViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-18.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class VerifyStepViewController:  BaseController ,UITextViewDelegate   {

    @IBOutlet weak var verifyCodeTxt: UITextView!
    @IBOutlet weak var showPhoneLabel: UILabel!
    @IBOutlet weak var showPhoneLblValue: UILabel!


    var verifyCodeTextPlaceHolder : String!
    var verifyText : String!

    override func viewDidLoad() {
        super.viewDidLoad()

        verifyCodeTextPlaceHolder = localizedString(forKey: "verifyCode", languageType: "ar")
        verifyText = localizedString(forKey: "verifyText", languageType: "ar")
        addPlaceHolder(textView: verifyCodeTxt, textPlace: verifyCodeTextPlaceHolder, tag: 0, textDelegate: self)

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        showPhoneLabel.text =  verifyText!
        showPhoneLblValue.text = RequestVisaSingleTone().sharedInstance.phoneNumber
        if  !RequestVisaSingleTone().sharedInstance.verfiyCode.isEmpty{
            verifyCodeTxt.text = RequestVisaSingleTone().sharedInstance.verfiyCode
        }else {
addPlaceHolder(textView: verifyCodeTxt, textPlace: verifyCodeTextPlaceHolder, tag: 0, textDelegate: self)
            
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       // firstStepRequestVisaViewController.scrollViewUpDelegate.moveDown()
        
        if textView.text.isEmpty {
            textView.textColor = UIColor.lightGray
        switch textView.tag {
            case 0  :
                textView.text = verifyCodeTextPlaceHolder
                RequestVisaSingleTone().sharedInstance.verfiyCode =  ""
                break;
            
        default : break
                
            }
        }
        }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    
    func textViewDidChange(_ textView: UITextView) {
        //        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)
        
        let textViewValue =  textView.text!
        switch textView.tag {
        case 0 :
            RequestVisaSingleTone().sharedInstance.verfiyCode = textViewValue
            break;
        default : break
        }
        
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var status =  true
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
        case 0:
            status = numberOfChars <= 8
            break
            
        default  : break
        }
     return status
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
