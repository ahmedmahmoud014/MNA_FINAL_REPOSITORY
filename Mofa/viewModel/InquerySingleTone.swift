//
//  InquerySingleTone.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-31.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation

class InquerySingleTone
{
    var sharedInstance: InquerySingleTone {
        struct Static {
            static let instance = InquerySingleTone()
        }
        return Static.instance
    }
   lazy var  pageTilte  = ""
    var selectStep : Int!
   lazy var    firstFeildValue = ""
   lazy var    secondFeildValue  = ""
   lazy var    DateValue   = ""
   lazy var    testThirdStep   = ""


}
