//
//  AlertNotifierViewExtension.swift
//  bridflix
//
//  Created by Gabriel on 20/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import UIKit

extension AlertNotifierView{
    
    func showAlert(alertMessage:String, view: UIViewController){
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}
