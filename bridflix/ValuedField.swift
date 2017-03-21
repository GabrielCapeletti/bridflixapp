//
//  ValuedField.swift
//  bridflix
//
//  Created by Gabriel on 20/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation

protocol ValuedField {
    
    associatedtype VALUE_TYPE
    
    func setFieldValue(value : VALUE_TYPE)
    func getFieldValue() -> VALUE_TYPE
}
