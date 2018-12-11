//
//  StringValidationStruct.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-08-06.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation

struct  StringValidationStruct {
    func validateStringValue  (checkedValued  : String , emptyValidationMessage :  String ,lenghtValidationMessage :  String ,lenght : Int ) -> Bool
    {
        //var status: Bool!
        if checkedValued.isEmpty {
            BaseController().showAlert(message: emptyValidationMessage, title: "")
            print("em")
            return false
            
        }
        else{
            if checkedValued.count != lenght {
                BaseController().showAlert(message: lenghtValidationMessage, title: "")
                return false
                print("le")
                
                
            }
            else {
                return  true
            }
        }
    }
}
