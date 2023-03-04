//
//  StringRawValue.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation

public protocol StringRawValue {
    var rawValue: Int { get }
    var string: String { get }
}

public extension StringRawValue {
    var string: String {
        return String(describing: self).firstUppercased
    }
}
