//
//  SegueIdentifiable.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

public protocol SegueIdentifiable: class {
    static var segueIdentifier: String { get }
}

public extension SegueIdentifiable {
    public static var segueIdentifier: String {
        // I like to use the class's name as an identifier
        // so this makes a decent default value.
        return String(describing: Self.self)
    }
}

extension UIStoryboardSegue: SegueIdentifiable {}
