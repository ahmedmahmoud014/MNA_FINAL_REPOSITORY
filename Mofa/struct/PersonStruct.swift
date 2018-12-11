//
//  PersonStruct.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-09-24.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import ObjectMapper

struct Person :  Mappable {

    var  userID, id: Int!
    var  title: String!
    var  completed: Bool!
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id    <- map["id"]
        userID    <- map["userId"]
        title <- map["title"]
        completed     <- map["completed"]
    }
}
