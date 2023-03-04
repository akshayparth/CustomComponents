//
//  FormController.swift
//  CustomComponents
//
//  Created by Devarshi on 4/21/18.
//  Copyright © 2018 Devarshi. All rights reserved.
//

import UIKit
//import ViewHelper

open class FormController: UIViewController, UITextFieldDelegate {
    private var keyboardHeight: CGFloat = 0
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Dismiss keyboard on background tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(FormController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FormController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let currentField = UIResponder.current as? UITextField, let currentFieldFrame = currentField.frame(withRespectTo: view, currentFrame: currentField.frame) {
            let keyboardY = keyboardFrame.origin.y
            let currentFieldExtendedY = currentFieldFrame.origin.y + currentFieldFrame.size.height
            if keyboardY <= currentFieldExtendedY {
                self.view.frame.origin.y = 0
                self.view.frame.origin.y -= currentFieldExtendedY - keyboardY
                self.view.frame.origin.y -= 20
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
