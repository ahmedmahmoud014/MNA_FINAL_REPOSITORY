//
//  InstructionMode.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-11-08.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import ObjectMapper

class InstructionsModel: Mappable{
    
    var titleValue : String?
    var instructionValue: String?
    
    required init?(map: Map) {
        
    }
    init(titleValue : String,instructionValue: String) {
        self.titleValue =  titleValue
        self.instructionValue  =  instructionValue
    }
    
    
    // Mappable
    func mapping(map: Map) {
        titleValue <- map["title"]
        instructionValue <- map["body"]

    }
    
    
}
