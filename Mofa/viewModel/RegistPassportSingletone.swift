//
//  RegistPassportSingletone.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation

class RegistPassportSingletone {
    var sharedInstance: RegistPassportSingletone {
        struct Static {
            static let instance = RegistPassportSingletone()
        }
        return Static.instance
    }
    var name : String = ""
    var passportId : String = ""
    var RECORDID : String = ""
    var selectedImage : Int =  0
    var phoneNumber : String = ""
    var email : String = ""
    var friendName : String = ""
    var friendPhone : String = ""
    var trvaleType : Int =  0
    var country : Int =  0
    var city : String = ""
    var arrivalDate : String = ""
    var leaveDate : String = ""
    var address : String = ""

}
