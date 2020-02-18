//
//  ApplicationCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {

    private weak var navigator: UIViewController!
    private var authenticator: AuthenticationService = .shared
    unowned var notifier: NotificationCenter = .services

    init(window: UIWindow) {

        let navigator = UIViewController()
        defer { self.navigator = navigator }

        window.rootViewController = navigator
        window.makeKeyAndVisible()

        UserDefaults.standard.set(false, forKey: DefaultKeys.userLoggedIn)
        notifier.addObserver(self, selector: #selector(start), name: .userLoggedIn, object: nil)
    }

    @objc func start() {
        if AuthenticationService.shared.isAuthenticated {
            navigator.present(HomepageCoordinator().controller(), animated: false)
        } else {
            navigator.present(LoginCoordinator().controller(), animated: false)
        }
    }

    deinit {
        assertionFailure("ApplicationCoordinator should always live")
    }
}
