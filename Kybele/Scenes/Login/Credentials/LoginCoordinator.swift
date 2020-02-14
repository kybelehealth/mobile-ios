//
//  LoginCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 13.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginCoordinator: Coordinator {

    var navigator: UINavigationController!

    func controller() -> UIViewController {
        let vc = LoginViewController()
        vc.coordinator = self

        let navigator = UINavigationController(rootViewController: vc)
        self.navigator = navigator

        return navigator
    }

    func showValidation() {
        let vc = LoginVerificationViewController()
        navigator.pushViewController(vc)
    }

    func start() {}
}
