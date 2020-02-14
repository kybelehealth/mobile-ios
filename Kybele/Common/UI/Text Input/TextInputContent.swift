//
//  TextInputContent.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

enum TextInputContent {
    case phone
    case email
    case smsCode
    case password
    case address
    case none
}

extension TextInputContent {

    var keyboardType: UIKeyboardType {
        switch self {
        case .phone, .smsCode: return .numberPad
        case .email: return .emailAddress
        case .password: return .asciiCapable
        default: return .default
        }
    }

    var maxLength: Int {
        switch self {
        case .email, .address: return 255
        case .smsCode: return 6
        default: return 128
        }
    }

    var minLength: Int {
        switch self {
        case .phone: return 17
        case .address: return 5
        default : return 0
        }
    }

    var isSecureTextEntry: Bool {
        return self == .password ? true : false
    }

    var defaultPlaceholder: String {
        return .empty
    }

    var mask: String? {
        switch self {
        case .phone:    return "X (XXX) XXX XX XX"
        default:        return nil
        }
    }

    var hint: String {
        switch self {

        case .address:
            return "At least \(minLength) characters"

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
