//
//  AlertNotifierView.swift
//  bridflix
//
//  Created by Gabriel on 20/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import UIKit

protocol AlertNotifierView {
    
    func showAlert(alertMessage:String, view: UIViewController)
    
}
