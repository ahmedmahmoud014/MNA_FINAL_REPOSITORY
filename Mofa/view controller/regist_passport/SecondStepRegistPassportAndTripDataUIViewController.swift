//
//  SecondStepRegistPassportAndTripDataUIViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit
import DocumentReader
class SecondStepRegistPassportAndTripDataUIViewController: BaseController ,UITextViewDelegate,GetRegularValue{
    
    
    
    
    
    @IBOutlet weak var regulaView: UIView!
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var selectImageTilte: UILabel!
    @IBOutlet weak var fourName: UITextView!
    @IBOutlet weak var passportId: UITextView!
    @IBOutlet weak var recordId: UITextView!
    @IBOutlet weak var scanRegulaTxt: UILabel!
    
    @IBOutlet weak var showSelectedImage: UIImageView!
    @IBOutlet weak var afterSelectImageView: UIView!
    var namePlaceHolder :String!
    var passportIdPlaceHolder :String!
    var recordIdPlaceHolder :String!
    var imagePicker = UIImagePickerController()
    static var getRegularValue:GetRegularValue!
    
    public static var selectRegulaOrGallery : Int =  0
    
    //public static var scrollViewUpDelegate : ScrollViewUpDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationReader()
        
        SecondStepRegistPassportAndTripDataUIViewController.getRegularValue   =  self
        
        
        namePlaceHolder = localizedString(forKey: "fourName", languageType: "ar")
        passportIdPlaceHolder = localizedString(forKey: "passportId", languageType: "ar")
        recordIdPlaceHolder = localizedString(forKey: "recordId", languageType: "ar")
        addPlaceHolderMarginTop(marginTop: 5,textView: fourName, textPlace: namePlaceHolder, tag: 0, textDelegate: self)
        addPlaceHolder(textView: passportId,textPlace: passportIdPlaceHolder, tag: 1, textDelegate: self)
        addPlaceHolder(textView: recordId,textPlace: recordIdPlaceHolder, tag: 2, textDelegate: self)
        selectedView.addShadow(roundBorder: 20, opacity: 0.1)
        regulaView.addShadow(roundBorder: 20, opacity: 0.1)
        selectImageTilte.text =  localizedString(forKey: "passportImage", languageType: "ar")
        
        scanRegulaTxt.text = localizedString(forKey: "scanPassport", languageType: "ar"); afterSelectImageView.addShadow(roundBorder: 20, opacity: 0.1)
        
        guard let name = fourName.text , fourName.text != ""  else {
            print("No name to submit")
            return
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        print("test test ")
        
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveDown()
        
        if textView.text.isEmpty {
            //            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)
            
            switch textView.tag {
            case 0 :
                textView.text = namePlaceHolder
                RegistPassportSingletone().sharedInstance.name = ""
                
                
                break;
            case 1 :
                textView.text =  passportIdPlaceHolder
                RegistPassportSingletone().sharedInstance.passportId = ""
                
                break;
            case 2 :
                textView.text =  recordIdPlaceHolder
                RegistPassportSingletone().sharedInstance.RECORDID = ""
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
            status = numberOfChars <= 80
            break
        case 2:
            status = numberOfChars <= RECORD_ID_VALIDATION
            break
        case 1:
            status = numberOfChars <= PASSPORT_NUMBER_VALIDATION
            break
            
        default:
            break
            
        }
        return status
        
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        //        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)
        
        let textViewValue =  textView.text!
        switch textView.tag {
        case 0 :
            RegistPassportSingletone().sharedInstance.name = textViewValue
            break;
        case 1 :
            RegistPassportSingletone().sharedInstance.passportId = textViewValue
            break;
        case 2 :
            RegistPassportSingletone().sharedInstance.RECORDID = textViewValue
            break;
            
        default: break
            
        }
        
    }
    
    @IBAction func selectImageAction(_ sender: UIButton) {
        
        if  sender.tag == 1 {
            SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery   =  2
            selectImageController()
        }else
        {
            SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery   =  1
            
            selectImageController()
            //   openCameraForRegula ()
            //   getImageFromGalleryForRegula()
            
        }
        
        
    }
    
    
    func getRegularResult(result: DocumentReaderResults) {
        
        
        if  result.jsonResult.results.count != 0   {
            
           // print("Result class: \(result.getTextFieldValueByType(fieldType: .ft_Given_Names)!)")
            // use fast getValue method
//            print("nnnnnnnnnnnn\(result.getTextFieldValueByType(fieldType: .ft_Given_Names)!)")
            print("nnnnnnnnnnnn2\(result.overallResult.rawValue)")
            
            
            let fname = result.getTextFieldValueByType(fieldType: .ft_Given_Names)
            let  lname = result.getTextFieldValueByType(fieldType: .ft_Surname)
            
        if fname  != nil  && lname != nil  {
//
    let name = "\(result.getTextFieldValueByType(fieldType: .ft_Given_Names)!) \(result.getTextFieldValueByType(fieldType: .ft_Surname)!)"
    let passportNumber  = result.getTextFieldValueByType(fieldType: .ft_Document_Number)
    print(" tessssss  \(String(describing: passportNumber))")
    print("NAME: \(name )")
    
    fourName.text  = name
    fourName.textColor  =  UIColor.black
    RegistPassportSingletone().sharedInstance.name =  name
    passportId.text   = passportNumber
    passportId.textColor  =  UIColor.black
    RegistPassportSingletone().sharedInstance.passportId =  passportNumber!
    afterSelectImageView.isHidden = false
    RegistPassportSingletone().sharedInstance.selectedImage = 1
    self.showSelectedImage.image = result.getGraphicFieldImageByType(fieldType: .gf_DocumentFront, source: .rawImage)
    
    
        }else {
            showAlert(message: "الرجاء حاول مره اخري ", title: "")
            }
            
            
            //self.nameLabel.text = name
            // for show image in  image view
            //        self.documentImage.image = result.getGraphicFieldImageByType(fieldType: .gf_DocumentFront, source: .rawImage)
            //        self.portraitImageView.image = result.getGraphicFieldImageByType(fieldType: .gf_Portrait)
            
            //go though all text results
            for textField in (result.textResult.fields) {
                guard let value = result.getTextFieldValueByType(fieldType: textField.fieldType, lcid: textField.lcid) else { continue }
                print("Field type name: \(textField.fieldType), value: \(value)")
            }
        }
    }
    
    func getGalleryResult(info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        afterSelectImageView.isHidden = false
        RegistPassportSingletone().sharedInstance.selectedImage = 1
        showSelectedImage.image = image
        self .dismiss(animated: true, completion: nil)
        //   imagePickerController(picker, didFinishPickingMediaWithInfo: image)
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
    //        //textView.contentInset = UIEdgeInsetsMake(10, 0, 0, 5)
    //
    //    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //  SecondStepRegistPassportAndTripDataUIViewController.scrollViewUpDelegate.moveUp( tag: textView.tag)
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    @IBAction func deleteSelectedImage(_ sender: Any) {
        afterSelectImageView.isHidden = true
        RegistPassportSingletone().sharedInstance.selectedImage = 0
    }
    
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self .present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //PickerView Delegate Methods
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //        NSLog("\(info)")
    //        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
    //        afterSelectImageView.isHidden = false
    //        RegistPassportSingletone().sharedInstance.selectedImage = 1
    //        showSelectedImage.image = image
    //        self .dismiss(animated: true, completion: nil)
    //
    //        // imagePickerController(picker, didFinishPickingMediaWithInfo: image)
    //    }
    
    
    // SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery   =  1
    
    func selectImageController(){
        let alert:UIAlertController=UIAlertController(title: localizedString(forKey: "imageSelectDialogTest", languageType: "ar"), message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        let cameraAction = UIAlertAction(title:localizedString(forKey: "camera", languageType: "ar")
            , style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            if  SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery   !=   1  {
                self.openCamera()
            }else {
                self.openCameraForRegula ()
                
            }
        }
        
        let gallaryAction = UIAlertAction(title:localizedString(forKey: "gallery", languageType: "ar")
            , style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            
            print("tttttttttttt \(SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery  )")
            
            if  SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery   !=   1  {
                self.openGallary()
            }else {
                self.getImageFromGalleryForRegula()
                
            }
            
            
        }
        
        let cancelAction = UIAlertAction(title:localizedString(forKey: "cancel", languageType: "ar"), style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        // Add the actions
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        if  SecondStepRegistPassportAndTripDataUIViewController.selectRegulaOrGallery   !=   1  {
            alert.addAction(gallaryAction)
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}


