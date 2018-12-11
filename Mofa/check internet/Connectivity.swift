//
//  Connectivity.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-21.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}




