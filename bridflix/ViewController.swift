
//
//  ViewController.swift
//  bridflix
//
//  Created by Gabriel on 20/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import UIKit

public class ViewController<VIEW:UIViewController> {
    
    let view : VIEW
    
    init(view _view:VIEW) {
        self.view = _view
    }
}
