//
//  Notification+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 18.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation

extension Notification {

    struct UserInfoKey: ExpressibleByStringLiteral, Hashable {

        private let value: String

        init(stringLiteral value: String) {
            self.value = value
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(value)
        }
    }
}

extension Notification {

    subscript<T: Any>(key: Notification.UserInfoKey) -> T? {
        return userInfo?[key] as? T
    }
}
