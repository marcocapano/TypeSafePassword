# TypeSafePassword
[![Swift Version][swift-image]](https://img.shields.io/badge/Swift-4.2-F16D39.svg?style=flat)
[![License][license-image]][license-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 
[![Build Status](https://travis-ci.org/marcocapano/TypeSafePassword.svg?branch=master)](https://travis-ci.org/marcocapano/TypeSafePassword)
A type-safe way to write password rules in Swift.

### The problem
Writing password rules in iOS 12 can really go wrong due to its string-based API.

### Proposed solution
Using this lightweight library you can now take advantage of Swift's powerful type system to avoid errors!

``` swift
//Usually you do
let rules = UITextInputPasswordRules(descriptor: "allowed: unicode; required: digits; minlength: 8; maxlength: 32")

//With TypeSafePassword instead:
let safeRules = UITextInputPasswordRules(rules: [.allowed(.unicode),
                                                 .required(.digits),
                                                 .minLength(8),
                                                 .maxLength(32)])
```


## Installation

Just drag TypeSafePassword.swift into your project and you're good to go.

[license-url]: LICENSE
