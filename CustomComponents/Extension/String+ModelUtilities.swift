//
//  String+ModelUtilities.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation

public extension String {
    var lowercasedFirst: String {
        guard !isEmpty else {
            return self
        }
        
        let lowercasedFirstLetter   = "\(self[startIndex])".lowercased()
        let secondIndex             = index(after: startIndex)
        let remainingString         = self[secondIndex..<endIndex]
        
        let capitalizedString       = "\(lowercasedFirstLetter)\(remainingString)"
        return capitalizedString
    }
    
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    func containsWhitespace() -> Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
    
    func contains(subString: String) -> Bool {
        return self.lowercased().range(of: subString.lowercased()) != nil
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var errorDescription: String? { return self }
    
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}

