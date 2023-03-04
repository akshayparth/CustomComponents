//
//  Bool+ViewUtilities.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

public extension Bool {
    func cellSelectionAccessory() -> UITableViewCell.AccessoryType {
        if self {
            return .checkmark
        }
        return .none
    }
}
