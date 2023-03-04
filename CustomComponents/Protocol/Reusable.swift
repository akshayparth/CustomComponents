//
//  Reusable.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//
// Shamelessly copied from http://alisoftware.github.io/swift/generics/2016/01/06/generic-tableviewcells/

import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    public static var reuseIdentifier: String {
        // I like to use the class's name as an identifier
        // so this makes a decent default value.
        return String(describing: Self.self)
    }
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable  {}
