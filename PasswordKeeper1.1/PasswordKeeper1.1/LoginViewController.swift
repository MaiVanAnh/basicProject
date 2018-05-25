//
//  LoginViewController.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/17/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var countPressLogin = 0
    
    var check = ""
    
    var pcView: PasscodeView?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.showPasscodeView()
        
    }

    fileprivate func showPasscodeView() {
        self.pcView = PasscodeView.instance(frameView: CGRect(x: 0, y: self.view.frame.height*0.5, width: self.view.frame.width, height: self.view.frame.height*0.5), superView: self.view)
        
        self.pcView?.delegate = self
        
    }
    
    fileprivate func isEmptyUserDefault() -> Bool {
        let user = UserDefaults.standard.string(forKey: "user")
        
        var count: Int = 0
        
        if user?.isEmpty == false {
            for _ in user! {
                count += 1
            }
        }
        
        if count == 4 {
            return false
        } else{
            return true
        }
        
    }
    
    fileprivate func compareUserDefault(user: String) -> Bool{
        if user == UserDefaults.standard.string(forKey: "user"){
            return true
        }
        return false
    }
    
    fileprivate func hiddenPasscodeView() {
        self.pcView?.isHidden = true
    }
    
//    fileprivate func showAccountVC() {
//        self.performSegue(withIdentifier: "IDLoginToAccount", sender: nil)
//    }
    

}

extension LoginViewController: PassCodeViewDelegate {

    func numberButtonTapped(_ passcodeView: PasscodeView, buttonSender: UIButton, number: Int) {

        
        if isEmptyUserDefault() == true {
            
            self.countPressLogin += 1
            
            self.check += "\(number)"
            
            if countPressLogin == 4 {
                UserDefaults.standard.set("\(check)", forKey: "user")
                
                let user = UserDefaults.standard.string(forKey: "user")
                
                print("userdefaults is: \(user ?? "")")
                
                self.check.removeAll()
                self.countPressLogin = 0
            }
            
        } else {
            self.countPressLogin += 1
            
            self.check += "\(number)"
            
            if countPressLogin == 4 {
                if compareUserDefault(user: check) == true{
                    print("Login successful")
                    //self.showAccountVC()
                    self.hiddenPasscodeView()
                }
                else{
                    self.check.removeAll()
                    self.countPressLogin = 0
                }
            }
        }
    }
}
