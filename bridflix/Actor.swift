//
//  Actor.swift
//  bridflix
//
//  Created by Gabriel on 21/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import ObjectMapper


class Actor: Mappable {

    var name:String?
    
    public required init?(map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        name <- map["name"]
    }

}
