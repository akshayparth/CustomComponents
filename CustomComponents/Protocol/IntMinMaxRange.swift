//
//  IntMinMaxRange.swift
//  ModelHelper
//
//  Created by Devarshi on 5/23/18.
//

import Foundation

public protocol IntMinMaxRange {
    var minValue: Int { get }
    var maxValue: Int { get }
    var currentMinValue: Int { get }
    var currentMaxValue: Int { get }
    
    func numberOfRowsMinValue() -> Int
    func numberOfRowsMaxValue() -> Int
    func currentMinValueRow() -> Int
    func currentMaxValueRow() -> Int
    func minValue(for row: Int) -> Int
    func maxValue(for row: Int) -> Int
    func minTitle(for row: Int) -> String
    func maxTitle(for row: Int) -> String
}

public extension IntMinMaxRange {
    func numberOfRowsMinValue() -> Int {
        return (currentMaxValue - minValue) + 1
    }
    
    func numberOfRowsMaxValue() -> Int {
        return (maxValue - currentMinValue) + 1
    }
    
    func currentMinValueRow() -> Int {
        return currentMinValue - minValue
    }
    
    func currentMaxValueRow() -> Int {
        return numberOfRowsMaxValue() - (maxValue - currentMaxValue) - 1
    }
    
    func minValue(for row: Int) -> Int {
        return minValue + row
    }
    
    func maxValue(for row: Int) -> Int {
        return currentMinValue + row
    }
    
    func minTitle(for row: Int) -> String {
        return "\(minValue(for: row))"
    }
    
    func maxTitle(for row: Int) -> String {
        return "\(maxValue(for: row))"
    }
}
