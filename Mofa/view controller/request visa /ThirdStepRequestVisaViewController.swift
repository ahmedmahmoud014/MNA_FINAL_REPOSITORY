//
//  ThirdStepRequestVisaViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ThirdStepRequestVisaViewController :  BaseController ,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    @IBOutlet weak var popUpInfo: UIView!
    
    @IBOutlet weak var popUpViewItem: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return  SingletonClass().sharedInstance.AllItemsFeild.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllItemsTableViewCell", for: indexPath) as! AllItemsTableViewCell
        
        var item  =   SingletonClass().sharedInstance.AllItemsFeild[indexPath.row]
        if indexPath.row  !=  SingletonClass().sharedInstance.AllItemsFeild.count-1{
        cell.addValue(itemTitle: item.itemTitle, itemValue: item.itemValue, showView: false )
        }else {
            cell.addValue(itemTitle: item.itemTitle, itemValue: item.itemValue, showView: true)

        }
        cell.addShadow(roundBorder: 20, opacity: 0)

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var selectImageTilte: UILabel!
    @IBOutlet weak var remarks: UITextView!
    @IBOutlet weak var showSelectedImage: UIImageView!
    @IBOutlet weak var afterSelectImageView: UIView!
    var remarksPlaceHolder :String!
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var allItemsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remarksPlaceHolder = localizedString(forKey: "remarks", languageType: "ar")
        addPlaceHolder(textView: remarks, textPlace: remarksPlaceHolder, tag: 2, textDelegate: self)
        selectedView.addShadow(roundBorder: 20, opacity: 0.1)
        selectImageTilte.text =  localizedString(forKey: "attachment", languageType: "ar")
        afterSelectImageView.addShadow(roundBorder: 20, opacity: 0.1)
        allItemsTable.addShadow(roundBorder: 20, opacity: 0.1)
       
//
        
//        popUpViewItem.addShadow(roundBorder: 20, opacity:0.1)
//        hidePopUPInfo.addShadow(roundBorder: 20, opacity:0.1)

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
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)

            switch textView.tag {
            case 2 :
                textView.text = remarksPlaceHolder
                RequestVisaSingleTone().sharedInstance.addresss = ""
            
                break;
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        }else {
            
            
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
      allItemsTable.reloadData()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let textViewValue =  textView.text!
        switch textView.tag {
        case 2 :
            textView.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5)
            if (textViewValue.maxLenght(maxNumber: 101)){
                RequestVisaSingleTone().sharedInstance.addresss = textViewValue
            }else {
                textView.text =   RequestVisaSingleTone().sharedInstance.addresss
                
            }
            break;
        default: break
            
        }
        
    }
    
    @IBAction func selectImageAction(_ sender: Any) {
        selectImageController()
    }
    
    @IBAction func deleteSelectedImage(_ sender: Any) {
        afterSelectImageView.isHidden = true
        RequestVisaSingleTone().sharedInstance.selectedImage = 0
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
    
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        NSLog("\(info)")
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        afterSelectImageView.isHidden = false
        RequestVisaSingleTone().sharedInstance.selectedImage = 1
        
        showSelectedImage.image = image
        self .dismiss(animated: true, completion: nil)
        
        // imagePickerController(picker, didFinishPickingMediaWithInfo: image)
    }
    
    func selectImageController(){
        let alert:UIAlertController=UIAlertController(title:  localizedString(forKey: "imageSelectDialogTest", languageType: "ar"), message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title:  localizedString(forKey: "camera", languageType: "ar"), style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title:  localizedString(forKey: "gallery", languageType: "ar"), style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title:  localizedString(forKey: "cancel", languageType: "ar"), style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        // Add the actions
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    @IBAction func showPopUP(_ sender: UIButton) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUPInfoViewController") as! PopUPInfoViewController
        vc.messageValue = " يرجي إرفاق صورة من قرار (الأجازة ، الأنتداب ) أو خطاب موافقة من جهة العمل.\nللمتقاعدين يرجي إرفاق خصاب شخصي يشمل أفراد العائلة عند الحاجة.\n في حالة الرغبة لإصدار تأشيرة لأفراد العائلة (بدون رب الأسرة )يجب إرفاق خطاب شخصي من ولي الأمر بالموافقة"
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.viewHeightValue = 300
        present(vc, animated: true)
        
    }
    
    @IBOutlet weak var hidePopUPInfo: UIButton!
}

