//
//  LoginViewController.swift
//  bridflix
//
//  Created by Gabriel on 15/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController,AlertNotifierView {

    @IBOutlet weak var passwordUI: UITextField!    
    @IBOutlet weak var usernameUI: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var titleStack: UIStackView!
    
    var controller:LoginController?;    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        controller = LoginController(view: self);
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        controller = LoginController(view: self);
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onLogin(_ sender: Any) {
        print("Try login")
        let fakeLog : LoginDTO = LoginDTO(userName: usernameUI.text!,password: passwordUI.text!)
        controller?.autenticateLogin(fakeLog)
    }
    
    func addCenterXConstraint(_ uiView : UIView,_ const: Int = 0){
        uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant:CGFloat(const)).isActive = true
    }
    
    func addCenterYConstraint(_ uiView : UIView,_ const: Int = 0){
        uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:CGFloat(const)).isActive = true
    }
    
    func setupConstraint(){

        titleStack.translatesAutoresizingMaskIntoConstraints = false
        usernameUI.translatesAutoresizingMaskIntoConstraints = false
        passwordUI.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        addCenterXConstraint(titleStack)
        addCenterXConstraint(usernameUI)
        addCenterXConstraint(passwordUI)
        addCenterXConstraint(loginButton)
        
        addCenterYConstraint(titleStack,-100)
        addCenterYConstraint(usernameUI,20)
        
        passwordUI.topAnchor.constraint(equalTo: usernameUI.bottomAnchor,constant:15).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordUI.bottomAnchor,constant:15).isActive = true

        titleStack.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh,for: .vertical)
        
        //titleStack.topAnchor.constraint(equalTo: view.topAnchor,multiplier: 0.7)
        
        //bookTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true

        
//        let labelBottom:NSLayoutConstraint = titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
//        let labelCenterX:NSLayoutConstraint = titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
//        
//        // 2
//        let imageViewTop:NSLayoutConstraint = imageView.topAnchor.constraint(equalTo: topAnchor)
//        let imageViewBottom:NSLayoutConstraint = imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor)
//        let imageViewCenterX:NSLayoutConstraint = imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
//        
//        // 3
//        let socialMediaTrailing:NSLayoutConstraint = socialMediaView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        let socialMediaTop:NSLayoutConstraint = socialMediaView.topAnchor.constraint(equalTo: topAnchor)
//        
//        NSLayoutConstraint.activate([imageViewTop, imageViewBottom, imageViewCenterX,labelBottom, labelCenterX,socialMediaTrailing, socialMediaTop])
//        
//        imageView.setContentCompressionResistancePriority(
//            UILayoutPriorityDefaultLow,
//            for: .vertical)
//        imageView.setContentCompressionResistancePriority(
//            UILayoutPriorityDefaultLow,
//            for: .horizontal)
//        
//        socialMediaView.axis = .vertical

    }

}

