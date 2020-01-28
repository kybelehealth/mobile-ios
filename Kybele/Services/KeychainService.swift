//
//  KeychainService.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import KeychainSwift

public final class KeychainService {

    public enum KeychainKeys: String {

        case authyId
    }

    public static let shared = KeychainService()

    private let keychain = KeychainSwift()

    public func get(key: KeychainKeys) -> String? {
        return keychain.get(key.rawValue)
    }

    public func set(value: String, key: KeychainKeys){
        keychain.set(value, forKey: key.rawValue)
    }
}
