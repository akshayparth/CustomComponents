//
//  UIView+Utilities.swift
//  ViewHelper
//
//  Created by Devarshi on 4/21/18.
//

import UIKit

public extension UIView {
    func frame(withRespectTo topMostView: UIView, currentFrame: CGRect) -> CGRect? {
        if let superView = self.superview {
            if superView == topMostView {
                return currentFrame
            } else {
                let superViewFrame = superView.frame
                var selfFrame = currentFrame
                selfFrame.origin.x += superViewFrame.origin.x
                selfFrame.origin.y += superViewFrame.origin.y
                return superView.frame(withRespectTo:topMostView, currentFrame:selfFrame)
            }
        } else {
            return nil
        }
    }
}
