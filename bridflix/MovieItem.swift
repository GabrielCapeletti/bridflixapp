//
//  MovieItem.swift
//  bridflix
//
//  Created by Gabriel on 20/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import ObjectMapper

public class MovieItem :Mappable{
    
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
