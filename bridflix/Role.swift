//
//  Role.swift
//  bridflix
//
//  Created by Gabriel on 21/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import ObjectMapper

class Role:Mappable{
    
    var id         :Int?
    var name       :String?
    var description:String?
    
    public required init?(map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        description <- map["description"]
        
    }

}
