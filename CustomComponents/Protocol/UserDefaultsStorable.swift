//
//  UserDefaultsStorable.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation

public protocol UserDefaultsStorable {
    func store<T>(value: T)
    func storedValue<T>() -> T?
}

public extension RawRepresentable where RawValue == String, Self: UserDefaultsStorable {
    func store<T>(value: T) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
    }
    
    func storedValue<T>() -> T? {
        return UserDefaults.standard.value(forKey: self.rawValue) as? T
    }
}
