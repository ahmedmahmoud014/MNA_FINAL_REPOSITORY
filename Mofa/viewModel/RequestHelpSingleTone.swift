//
//  RequestHelpSingleTone.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
class RequestHelpSingleTone {
    var sharedInstance: RequestHelpSingleTone {
        struct Static {
            static let instance = RequestHelpSingleTone()
        }
        return Static.instance
    }
    var firstname : String = ""
    var fathername : String = ""
    var grandFahterName : String = ""
    var familyName : String =  ""
    var passportId : String = ""
    var recordId : String = ""
    var phoneNumber  : String = ""
    var email : String = ""
    var representation : Int =  0
    var country : Int =  0
    var city : String = ""
    var details : String = ""
    var address : String = ""
    var allImage : [String] =  []

}
