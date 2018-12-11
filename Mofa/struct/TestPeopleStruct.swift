//
//  TestPeopleStruct.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-09-24.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import ObjectMapper
struct TestPeople   :  Mappable {
    
    var name ,birth_year,eye_color,skin_color,hair_color : String?
    var films  : [String]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        birth_year    <- map["birth_year"]
        eye_color <- map["eye_color"]
        skin_color     <- map["skin_color"]
        hair_color <- map["hair_color"]
        films     <- map["films"]
    }
    
}
