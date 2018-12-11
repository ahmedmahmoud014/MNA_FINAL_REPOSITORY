//
//  SingletonClass.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-04-15.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
import DocumentReader
class SingletonClass {
    var sharedInstance: SingletonClass {
        struct Static {
            static let instance = SingletonClass()
        }
        return Static.instance
    }
    var dataText : String = ""
    
    var arshataType : Int =  0;
    var representationType : Int =  0;
    var NearestORSearchCountry : Int =  0;
    var arshataTitle : String =  "";
    var country : RepresentationStruct!
    var representationDetails : RepresentationDetails!
    var allItems = [PopupStruct]()
    var travelType : Int = 1000
    var countryValue : Int  = 1000
    
    var doneImage : String!
    var doneTitle : String!
    var  allImageSelected = [UIImage]()
    var scrollViewUPTag : Int =  0;
    var phoneNumberLenght =  0 ;
    var AllItemsFeild =  [AllItemsEnteredStruct]();
//    var result: DocumentReaderResults?

}
