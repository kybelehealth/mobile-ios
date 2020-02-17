//
//  TextInputContent.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

enum TextInputContent {
    case email
    case phone
    case smsCode
    case name
    case surname
    case address
}

extension TextInputContent {

    var placeholder: String {
        let text: String
        
        switch self {
        case .email:
            text = "Enter Email"
        case .phone:
            text = "Phone Number"
        case .smsCode:
            text = "Enter Code"
        case .name:
            text = "Name"
        case .surname:
            text = "Surname"
        case .address:
            text = "Address"
        }
        
        return text.localized()
    }
    
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .phone: return .phonePad
        case .smsCode: return .numberPad
        case .email: return .emailAddress
        default: return .default
        }
    }
    

    func isValid(text: String?) -> Bool {
        let immutableText = text.ifNil(.empty)
        switch self {
        case .email:
            return immutableText.isValidEmail
            
        default:
            return immutableText.count >= self.minLength
        }
    }

    var maxLength: Int {
        switch self {
        case .email, .address: return 255
        case .smsCode: return 6
        default: return 128
        }
    }

    private var minLength: Int {
        switch self {
        case .phone: return 17
        case .address: return 5
        case .smsCode: return 6
        case .name, .surname: return 2
        default : return 0
        }
    }
    
    var mask: String? {
        switch self {
        case .phone: return "X (XXX) XXX XX XX"
        default: return nil
        }
    }

    var hint: String {
        switch self {
        case .address:
            return "At least \(minLength) characters".localized()

        case .email:
            return "eg. example@gmail.com".localized()

        case .phone:
            return "eg. 0 (530) 123 45 67".localized()

        case .smsCode:
            return "eg. 123456".localized()

        default:
            return .empty
        }
    }
}

extension String {

    func formatNumber(with mask: String) -> String {
        let cleanNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return format(raw: cleanNumber, mask: mask)
    }

    private func format(raw: String, mask: String) -> String {
        var result = String.empty

        var index = raw.startIndex

        for char in mask {
            if index == raw.endIndex {
                break
            }
            if char == "X" {
                result.append(raw[index])
                index = raw.index(after: index)
            } else {
                result.append(char)
            }
        }

        return result
    }
}
