//
//  UIResponder+Utilities.swift
//  ViewHelper
//
//  Created by Devarshi on 4/21/18.
//

import Foundation
import UIKit

public extension UIResponder {
    private weak static var _currentFirstResponder: UIResponder? = nil
    
    static var current: UIResponder? {
        UIResponder._currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(findFirstResponder(sender:)), to: nil, from: nil, for: nil)
        return UIResponder._currentFirstResponder
    }
    
    @objc internal func findFirstResponder(sender: AnyObject) {
        UIResponder._currentFirstResponder = self
    }
}
