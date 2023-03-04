//
//  SegueHandler.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//
// Shamelessly copied from - https://www.bignerdranch.com/blog/using-swift-enumerations-makes-segues-safer/

import UIKit

public protocol SegueHandler {
    associatedtype ViewControllerSegue: RawRepresentable
    func segueIdentifierCase(for segue: UIStoryboardSegue) -> ViewControllerSegue
    func route(for segue: UIStoryboardSegue)
}

public extension SegueHandler where ViewControllerSegue.RawValue == String {
    func segueIdentifierCase(for segue: UIStoryboardSegue) -> ViewControllerSegue {
        guard let identifier = segue.identifier?.lowercasedFirst,
            let identifierCase = ViewControllerSegue(rawValue: identifier) else {
                fatalError("Could not map segue identifier -- \(String(describing: segue.identifier)) -- to segue case")
        }
        return identifierCase
    }
    
    func route(for segue: UIStoryboardSegue) { }
}
