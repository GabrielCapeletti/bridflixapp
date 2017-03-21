//
//  User.swift
//  bridflix
//
//  Created by Gabriel on 16/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable{
    
    var token   :String?
    var userName:String?
    var password:String?
    
    public required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        userName    <- map["userName"]
        password    <- map["password"]
        token       <- map["token"]
    }
    
}
