//
//  TypeSafePasswordTests.swift
//  TypeSafePasswordTests
//
//  Created by Marco Capano on 18/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest
import UIKit
@testable import TypeSafePassword

class TypeSafePasswordTests: XCTestCase {

    func testPasswordRuleGeneration() {
        let rules: [PasswordRuleType] = [.allowed(.unicode), .required(.digits), .minLength(8), .maxLength(32)]
        let rule = UITextInputPasswordRules(rules: rules)
        let expectedDescriptor = "allowed: unicode; required: digits; minlength: 8; maxlength: 32"
        
        XCTAssertEqual(rule.passwordRulesDescriptor, expectedDescriptor)
    }
    
    func testEmptyRules() {
        let rule = UITextInputPasswordRules(rules: [PasswordRuleType]())
        let expectedDescriptor = ""
        
        XCTAssertEqual(rule.passwordRulesDescriptor, expectedDescriptor)
    }

}
