//
//  HelpRequestStruct.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-11-07.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import ObjectMapper
class HelpRequest: Mappable {
    var userId: String?
    var firstName: String?
    var fartherName: String?
    var grandFatherName: String?
    var passportId: String?
    var nationalId: String?
    var phoneNumber: String?
    var email: String?
    var city: String?
    var mission: String?
    var address: String?
    var helpDetails: String?
    var attachment: [String]?
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        userId <- map["userId"]
         firstName <- map["firstName"]
         fartherName <- map["fartherName"]
         grandFatherName <- map["grandFatherName"]
         passportId  <- map["passportId"]
         nationalId <- map["nationalId"]
         phoneNumber <- map["phoneNumber"]
         email <- map["email"]
         city <- map["city"]
         mission <- map["mission"]
         address <- map["address"]
         helpDetails <- map["helpDetails"]
         attachment <- map["attachment"]
    }
    
}
