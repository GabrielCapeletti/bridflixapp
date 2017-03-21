//
//  LoginController.swift
//  bridflix
//
//  Created by Gabriel on 16/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import UIKit

public class LoginController : ViewController<LoginViewController>{
    
    func autenticateLogin(_ login: LoginDTO) {
        if login.password.isEmpty || login.userName.isEmpty {
            print("show alert")
            view.showAlert(alertMessage: "Invalid Username or Password",view: view)
        }else{
            ServerConnectionManager.registerUser(login: login,failFun: onLoginFail,successFun: onLoginSuccess)
        }
    }
    
    func onLoginFail() {
        view.showAlert(alertMessage: "Server comunication problem",view: view)
    }
    
    func onLoginSuccess() {
        view.present(MovieTableViewController(nibName: nil, bundle: nil), animated: true)
    }
}
