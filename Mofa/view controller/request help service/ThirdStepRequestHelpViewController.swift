//
//  ThirdStepRequestHelpViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ThirdStepRequestHelpViewController: BaseController,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate{
    public static var selectAttatchmentDelegate : SelectAttatchmentDelegate!
    @IBOutlet weak var allAttachmentTableView: UITableView!
    @IBOutlet weak var selectTitle: UILabel!
    @IBOutlet weak var helpDetails: UITextView!
    @IBOutlet weak var selectImageView: UIView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    var imagePicker = UIImagePickerController()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return SingletonClass().sharedInstance.allImageSelected.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttatchmentTableViewCell", for: indexPath) as! AttatchmentTableViewCell
        cell.addShadow(roundBorder: 20, opacity: 0.1)
        cell.assign(image: SingletonClass().sharedInstance.allImageSelected[indexPath.section])
//        cell.delete?.tag = indexPath.row
//        cell.delete?.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer (target: self, action: #selector(imgTap(tapGesture:)))
//        tapGesture.numberOfTapsRequired = 1
//        cell.imageView?.addGestureRecognizer(tapGesture)
        
        
        cell.delete.tag = indexPath.section
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        cell.delete.isUserInteractionEnabled = true
    cell.delete.addGestureRecognizer(tapGestureRecognizer)
        return cell
    }
    
    // method to run when imageview is tapped
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let imgView = tapGestureRecognizer.view as! UIImageView
        tableHeight.constant  =  tableHeight.constant - 60

        ThirdStepRequestHelpViewController.selectAttatchmentDelegate.decreaseHeight()
        SingletonClass().sharedInstance.allImageSelected
           .remove(at: imgView.tag)
        allAttachmentTableView.reloadData()
       
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped table view cell index is \(indexPath.row).")
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
//        allImageSelected.append(image)
//        allAttachmentTableView.reloadData()
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
       
        ThirdStepRequestHelpViewController.selectAttatchmentDelegate.addHeight()
        tableHeight.constant  =  tableHeight.constant + 60
        SingletonClass().sharedInstance.allImageSelected.append(image!)
        allAttachmentTableView.reloadData()
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
    
    
    var detailsPlaceHolder :String!

    override func viewDidLoad() {
        super.viewDidLoad()
        helpDetails.addShadow(roundBorder: 20, opacity: 0.1)
        selectImageView.addShadow(roundBorder: 20, opacity: 0.2)
        detailsPlaceHolder = localizedString(forKey: "helpDetails", languageType: "ar")
        selectTitle.text = localizedString(forKey: "attachment", languageType: "ar")
        addPlaceHolder(textView: helpDetails, textPlace: detailsPlaceHolder, tag: 3, textDelegate: self)
        
        if    SingletonClass().sharedInstance.allImageSelected.count != 0{
            
            tableHeight.constant = tableHeight.constant + CGFloat(SingletonClass().sharedInstance.allImageSelected.count * 60)
            
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func selectAction(_ sender: UIButton) {
        
        if     SingletonClass().sharedInstance.allImageSelected.count < 4
        {
        selectImageController()

    }else {
    showAlert(message: localizedString(forKey: "attachmentNumberFour", languageType: "ar"), title: "")
    }
        
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
        //FirstStepRequestHelpViewController.scrollViewUpDelegate.moveDown()

        if textView.text.isEmpty {
            textView.textContainerInset = UIEdgeInsetsMake(textView.bounds.height/3, 5, 5, 5)
            switch textView.tag {
            case 3 :
                textView.text = detailsPlaceHolder
                RequestHelpSingleTone().sharedInstance.details = ""

                break;
            default: break
                
            }
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let textViewValue =  textView.text!
        textView.text = textViewValue.stripped

        textView.textContainerInset = UIEdgeInsetsMake(15, 5, 5, 5)

        if (textViewValue.maxLenght(maxNumber: 101)){
            RequestHelpSingleTone().sharedInstance.details = textViewValue
        }
        else {
            textView.text = RequestHelpSingleTone().sharedInstance.details
            
        }    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
