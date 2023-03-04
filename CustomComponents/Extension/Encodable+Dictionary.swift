//
//  Encodable+Dictionary.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation

public protocol EncodableDictionaryProvider {
    var dictionary: [String: Any] { get }
}

public extension Encodable {
    var dictionary: [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] ?? [:]
        }
        catch {
            return [:]
        }
    }
}
