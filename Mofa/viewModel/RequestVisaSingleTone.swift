//
//  RequestVisaSingleTone.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-28.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
class RequestVisaSingleTone {
    var sharedInstance: RequestVisaSingleTone {
        struct Static {
            static let instance = RequestVisaSingleTone()
        }
        return Static.instance
    }
  
    var name  : String = ""

    var passportId : String = ""
    var recordId : String = ""
    var birthdate : String = ""
    var phoneNumber  : String = ""

    var verfiyCode : String = ""
    var representation : Int =  0
    var country : Int =  0
    var email : String = ""
    var details : String = ""
    var city : String = ""
    
    
    var addresss : String = ""

    var selectedImage : Int =  0

    
}
