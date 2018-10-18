//
//  PasswordRuleType.swift
//  TypeSafePassword
//
//  Created by Marco Capano on 18/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///A password rule. Specifies requirements for a new password.
public enum PasswordRuleType: CustomStringConvertible {
    public typealias UnsignedInt = UInt
    
    ///Character Class, indicates a family of characters.
    public enum CharacterClass: String {
        
        ///Uppercased characters (A-Z).
        case upper = "upper"
        
        ///Lowercased characters (a-z).
        case lower = "lower"
        
        ///Numerical digits (0-9).
        case digits = "digits"
        
        ///Special characters (-~!@#$%^&*_+=`|(){}[:;"'<>,.? ] and space).
        case special = "special"
        
        ///All unicode characters.
        case unicode = "unicode"
        
        ///All ASCII printable characters.
        case asciiPrintable = "ascii-printable"
    }
    
    /**
     Specifies the maximum length of consecutive characters in your password. If you have multiple max-consecutive properties in your rule, the minimum value of the properties will be applied. Without this property, the password can be of any length.
     */
    case maxConsecutive(UnsignedInt)
    
    ///Specifies the maximum length of the password.
    case maxLength(UnsignedInt)
    
    ///Specifies the minimum length of the password.
    case minLength(UnsignedInt)
    
    ///Specifies the required character class. All passwords must follow it.
    case required(CharacterClass)
    
    ///Specifies a class of allowed characters for a password.
    case allowed(CharacterClass)
    
    public var description: String {
        switch self {
        case let .maxConsecutive(max):
            return "max-consecutive: \(max)"
        case let .maxLength(max):
            return "maxlength: \(max)"
        case let .minLength(min):
            return "minlength: \(min)"
        case let .required(charClass):
            return "required: \(charClass)"
        case let .allowed(charClass):
            return "allowed: \(charClass)"
        }
    }
}

//MARK: - Convenience Extensions

public extension Array where Element: CustomStringConvertible {
    ///Returns an array containing a description of all the elements in the array.
    public func descriptions() -> [String] {
        return map({ $0.description })
    }
}

public extension UITextInputPasswordRules {
    ///Initialises a UITextInputPasswordRules from an array of rules.
    public convenience init(rules: [PasswordRuleType]) {
        let descriptor = rules.descriptions().joined(separator: "; ")
        self.init(descriptor: descriptor)
    }
}



