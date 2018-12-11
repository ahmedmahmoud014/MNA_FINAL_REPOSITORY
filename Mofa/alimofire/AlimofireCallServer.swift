//
//  AlimofireCallServer.swift
//  TestTabllHeader
//
//  Created by iOSAccount on 1/17/18.
//  Copyright © 2018 testtableheader. All rights reserved.
//

import Foundation
import Alamofire
class AlimofireCallServer{
    var    alimofireCallBack :AlimofireCallBak?
  func getData(url  :  String) {
       // "http://api.androidhive.info/contacts/"
    print("service url is : \(url)")
        Alamofire.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseJSON { (responseData) -> Void in
                switch responseData.result {
                case .success:
                    print(" Successful ")
                    let result = responseData.result.value as? [String: Any]
                    self.alimofireCallBack?.succes(response:result!)
                // self.delegate?.succes(value: responseData.result.value!)
                  case .failure(let error):
                    print(error.localizedDescription)
                    self.alimofireCallBack?.faild(response: "faild is done ")

                    // self.delegate?.error(value: responseData.result.value!)
                    
    
                }
                
        }
        
    }
        
    
    func postData(url  :  String) {
        
    }

}
