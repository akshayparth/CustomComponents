//
//  Dictionary+ModelUtilities.swift
//  ModelHelper
//
//  Created by Devarshi on 6/18/18.
//

import Foundation

public extension Dictionary {
    func firstKey<T>() -> T? {
        return Array(self).first?.key as? T
    }
    
    func allKeys<T>() -> [T]? {
        return Array(self.keys) as? [T]
    }
}
