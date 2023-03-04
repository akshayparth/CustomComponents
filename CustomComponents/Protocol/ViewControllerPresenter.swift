//
//  ViewControllerPresenter.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

public protocol ViewControllerPresenter {
    func presentAsRoot()
}

public extension ViewControllerPresenter where Self: UIViewController {
    func presentAsRoot() {
        UIApplication.shared.keyWindow?.rootViewController = self
    }
}

extension UIViewController: ViewControllerPresenter {}
