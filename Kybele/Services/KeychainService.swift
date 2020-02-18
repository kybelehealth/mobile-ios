//
//  KeychainService.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import KeychainSwift

final class KeychainService {

    enum KeychainKeys: String {
        case authyId
    }

    static let shared = KeychainService()

    let keychain = KeychainSwift()

    func get(key: KeychainKeys) -> String? {
        return keychain.get(key.rawValue)
    }

    func set(value: String, key: KeychainKeys){
        keychain.set(value, forKey: key.rawValue)
    }
}
