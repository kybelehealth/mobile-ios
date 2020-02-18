//
//  AuthenticationService.swift
//  Kybele
//
//  Created by Rufat Mirza on 18.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation

final class AuthenticationService {

    static let shared = AuthenticationService()

    private unowned let notifier: NotificationCenter = .services

    func authenticate() {
        UserDefaults.standard.set(true, forKey: DefaultKeys.userLoggedIn)
        notifier.enqueue(name: .userLoggedIn)
    }

    var isAuthenticated: Bool {
        return UserDefaults.standard.bool(forKey: DefaultKeys.userLoggedIn)
    }
}
