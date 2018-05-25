//
//  PasscodeView.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/17/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

protocol PassCodeViewDelegate: class {
    func numberButtonTapped(_ passcodeView: PasscodeView, buttonSender: UIButton, number: Int)
}

class PasscodeView: UIView {

    weak var delegate: PassCodeViewDelegate?
    
    @IBOutlet var viewUnlock: UIView!
    
    
    @IBAction func buttonUnlock(_ sender: UIButton) {
        self.viewUnlock.isHidden = true
        self.viewPasscode.isHidden = false
        
    }
    @IBAction func One(_ sender: UIButton) {
        print("1")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 1)
    }
    
    @IBAction func Two(_ sender: UIButton) {
        print("2")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 2)
    }
    
    @IBAction func Three(_ sender: UIButton) {
        print("3")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 3)
    }
    @IBAction func Four(_ sender: UIButton) {
        print("4")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 4 )
        
    }
    
    @IBAction func Five(_ sender: UIButton) {
        print("5")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 5)
        
    }
    
    @IBAction func Six(_ sender: UIButton) {
        print("6")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 6)
    }
    
    
    @IBAction func Seven(_ sender: UIButton) {
        print("7")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 7)
    }
    
    @IBAction func Eight(_ sender: UIButton) {
        print("8")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 8)

    }
    
    @IBAction func Nine(_ sender: UIButton) {
        print("9")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 9)
        
    }
    
    @IBAction func Zero(_ sender: UIButton) {
        print("0")
        self.delegate?.numberButtonTapped(self, buttonSender: sender, number: 0)
    }
    
    @IBOutlet var viewPasscode: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instance(frameView: CGRect, superView: UIView) -> PasscodeView? {
        
        if let pcView = UINib(nibName: "PasscodeView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PasscodeView {
            
            pcView.frame = frameView
            
            superView.addSubview(pcView)
            return pcView
        }
        
        return nil
    }
}
