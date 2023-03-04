//
//  RowSelectionHandler.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation

public protocol RowSelectionHandler {
    /// Returns true for row to be check marked, false for row to be unchecked, nil if selection not allowed, also row number of previously selected row as per that section
    mutating func shouldAllowSelection(for indexPath: IndexPath) -> (Bool?, IndexPath?)
    
    /// Returns true or false based on if a row is selected or not
    func showSelected(for indexPath: IndexPath) -> Bool
}

public protocol RowSelectionRule {
    /// Returns true if section allows multi selection, false if it allows single selection, nil if no selection
    var allowsMultiSelection: Bool? { get }
}
