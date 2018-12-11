//
//  FourthStepRegistPassportAndTripDataUIViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class FourthStepRegistPassportAndTripDataUIViewController: BaseController ,UITextViewDelegate,PopUPDelegate{
    func selectedItem(itemValue: Int,tag :Int) {
        print("index \(itemValue)")
        let value  = SingletonClass().sharedInstance.allItems[itemValue].title
        if tag ==  1
        {
            RegistPassportSingletone().sharedInstance.trvaleType = 1
            SingletonClass().sharedInstance.travelType = itemValue
            travellintTypBtn.setTitle("", for: .normal)
            travellintTypBtn.setTitleColor(UIColor.black, for: .normal)
            travellintTypBtn.setTitle(value, for: .normal)

        }else {
            RegistPassportSingletone().sharedInstance.country = 1
            SingletonClass().sharedInstance.countryValue = itemValue
            countryTypBtn.setTitle("", for: .normal)
            countryTypBtn.setTitleColor(UIColor.black, for: .normal)
            countryTypBtn.setTitle(value, for: .normal)
        }
    }
    

    @IBAction func travellingTypeAction(_ sender: UIButton) {
        showPopup(tag: 1)
    }
    
    @IBAction func countryTypAction(_ sender: UIButton) {
        showPopup(tag: 2)
    }
    @IBOutlet weak var travellintTypBtn: UIButton!
    @IBOutlet weak var countryTypBtn: UIButton!

    @IBOutlet weak var travellingTypeTXt: UITextView!
    @IBOutlet weak var countryGoToTxt: UITextView!
    @IBOutlet weak var cityGotoTxt: UITextView!
    @IBOutlet weak var arrivalDateTxt: UITextView!
    @IBOutlet weak var leaveDateTxt: UITextView!
    @IBOutlet weak var addressTxt: UITextView!
    
    var  arrivalDate  : Date!
    var  leaveDate  : Date!

    var datePicker = UIDatePicker()
    
    var datePickerLeave = UIDatePicker()


    var travelTextPlaceHolder : String!
    var countryGoToTextPlaceHolder : String!
    var cityGotoTextPlaceHolder : String!
    var arrivalDateTextPlaceHolder : String!
    var leaveDateTextPlaceHolder : String!
    var addressTextPlaceHolder : String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        travelingType  = "نوع السفر ";
//        countryGoto  = "الدولة المسافرإليها";
//        cityGoto  = "المدينه";
//        arraivalDate  = "تاريخ الوصول ";
//        leaveDate  = "تاريخ المغادرة المتوقع";
//        addressInCountry  = "العنوان في الدولة المسافر إليها";
        
        travelTextPlaceHolder = localizedString(forKey: "travelingType", languageType: "ar")
        countryGoToTextPlaceHolder = localizedString(forKey: "countryGoto", languageType: "ar")
        cityGotoTextPlaceHolder = localizedString(forKey: "cityGoto", languageType: "ar")
        arrivalDateTextPlaceHolder = localizedString(forKey: "arraivalDate", languageType: "ar")
        leaveDateTextPlaceHolder = localizedString(forKey: "leaveDate", languageType: "ar")
        addressTextPlaceHolder = localizedString(forKey: "addressInCountry", languageType: "ar")
        travellintTypBtn.setTitle(travelTextPlaceHolder, for: .normal)

        countryTypBtn.setTitle(countryGoToTextPlaceHolder, for: .normal)
//        addPlaceHolder(textView: travellingTypeTXt, textPlace: travelTextPlaceHolder, tag: 0)
//        addPlaceHolder(textView: countryGoToTxt,textPlace: countryGoToTextPlaceHolder, tag: 1)
        
        addPlaceHolder(textView: cityGotoTxt,textPlace: cityGotoTextPlaceHolder, tag: 2, textDelegate: self)
        addPlaceHolder(textView: arrivalDateTxt,textPlace: arrivalDateTextPlaceHolder, tag: 3, textDelegate: self)
        addPlaceHolder(textView: leaveDateTxt,textPlace: leaveDateTextPlaceHolder, tag: 4, textDelegate: self)
        addPlaceHolder(textView: addressTxt,textPlace: addressTextPlaceHolder, tag: 5, textDelegate: self)
        
        travellintTypBtn.addShadow(roundBorder: 20, opacity: 0.1)
        countryTypBtn.addShadow(roundBorder: 20, opacity: 0.1)
        
//        travellintTypBtn.titleLabel?.textColor = UIColor.gray
//        countryTypBtn.titleLabel?.textColor = UIColor.gray
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        arrivalDateTxt.inputView = datePicker
        datePicker.addTarget(self, action: #selector(self.datePickerChanged), for: UIControlEvents.valueChanged)
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(self.datePickerChanged), cancelSelector: #selector(self.dismissPicker))
        arrivalDateTxt.inputAccessoryView = toolBar
        
        
        datePickerLeave = UIDatePicker()
        datePickerLeave.datePickerMode = .date
        leaveDateTxt.inputView = datePickerLeave
        datePickerLeave.addTarget(self, action: #selector(self.datePickerChanged), for: UIControlEvents.valueChanged)
        let toolBarLeave = UIToolbar().ToolbarPiker(mySelect: #selector(self.datePickerChangedLeave), cancelSelector: #selector(self.dismissPicker))
        leaveDateTxt.inputAccessoryView = toolBarLeave
        leaveDateTxt.isUserInteractionEnabled =  false



    }
    
    // Swift 4
    @objc func dismissPicker() {
        
        view.endEditing(true)
      // SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveDown()

    }
    
    @objc func datePickerChangedLeave() {
        print("time picker changed for ceremony")

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        leaveDate = datePickerLeave.date
       // SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveUp(tag: 4)
        if (!compareDate()){
        //leaveDateTxt.text = ""
            leaveDateTxt.textColor = UIColor.black
        leaveDateTxt.text = dateFormatter.string(from: datePickerLeave.date)
            RegistPassportSingletone().sharedInstance.leaveDate = "date"

        view.endEditing(true)
        }
            else
        {showAlert(message:localizedString(forKey: "leaveDateValidation", languageType: "ar"), title: "")
            leaveDateTxt.text = ""
            RegistPassportSingletone().sharedInstance.leaveDate = ""
        }
    }
     @objc func datePickerChanged() {
        print("time picker changed for ceremony")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        arrivalDate  = datePicker.date
        arrivalDate.addingTimeInterval(100)
        //arrivalDateTxt.text = ""
         arrivalDateTxt.textColor = UIColor.black
         arrivalDateTxt.text = dateFormatter.string(from: datePicker.date)
         leaveDateTxt.isUserInteractionEnabled =  true
         RegistPassportSingletone().sharedInstance.arrivalDate = "date"
        
        if !RegistPassportSingletone().sharedInstance.leaveDate .isEmpty
        {
         leaveDateTxt.textColor = UIColor.gray
        leaveDateTxt.text = leaveDateTextPlaceHolder
        RegistPassportSingletone().sharedInstance.leaveDate = ""
        }

       //  SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveUp(tag: 3)


       // view.endEditing(true)
    }
  func compareDate() -> Bool  {
    
    if arrivalDate == leaveDate
    {
        
        print("equal ")
        return false 
    }
    else if arrivalDate > leaveDate
    {
        print("more  ")

        return true
    }
    else
    {
        print("less ")

        return false


    }
    }
    
   
    
    func showPopup(tag : Int ){
        
        PopUPViewController.popUPDelegate = self
         PopUPViewController.tag = tag
        if tag == 1 {
            
            
            

            SingletonClass().sharedInstance.allItems.removeAll()
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "مهمة شخصية"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "علاج"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "عمل"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "دراسة"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "سياحة"))

            
          PopUPViewController.selectedValue   = SingletonClass().sharedInstance.travelType

        }
        else {
            
            
            SingletonClass().sharedInstance.allItems.removeAll()
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "مصر "))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "عمان"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "الادرن"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "اليابان"))
            SingletonClass().sharedInstance.allItems.append(PopupStruct(image: "radio_button",title: "الإمارات"))


            PopUPViewController.selectedValue   = SingletonClass().sharedInstance.countryValue
        }
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUPViewController")
        vc?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(vc!, animated: true)
        
        
//        let vc = PopUPViewController(nibName: "PopUPViewController", bundle: nil)
//        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        present(vc, animated: true)
    }
   
    
    func textViewDidBeginEditing(_ textView: UITextView) {
     //   SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveUp( tag: textView.tag)

        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
  
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveDown()

        if textView.text.isEmpty {
//            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
//            case 0  :
//                textView.text = travelTextPlaceHolder
//                RegistPassportSingletone().sharedInstance.trvaleType = 0
//                break;
//            case 1 :
//                textView.text =  countryGoToTextPlaceHolder
//                RegistPassportSingletone().sharedInstance.country = 0
//
//                break;
            case 2 :
                textView.text =  cityGotoTextPlaceHolder
                RegistPassportSingletone().sharedInstance.city = ""

            case 3 :
                textView.text =  arrivalDateTextPlaceHolder
                RegistPassportSingletone().sharedInstance.arrivalDate = ""

                break;
            case 4 :
                textView.text =  leaveDateTextPlaceHolder
                RegistPassportSingletone().sharedInstance.leaveDate = ""
                break;
            case 5 :
                textView.text =  addressTextPlaceHolder
                RegistPassportSingletone().sharedInstance.address = ""
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
        case 2 :
                RegistPassportSingletone().sharedInstance.city = textViewValue
            
            break;

        case 5 :
                RegistPassportSingletone().sharedInstance.address = textViewValue
           
            break;
            
        default: break
            
        }
    }

   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var status =  true
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        switch textView.tag {
        case 2:
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

}
