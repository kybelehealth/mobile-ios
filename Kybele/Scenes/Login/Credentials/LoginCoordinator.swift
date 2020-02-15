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
        let controller = LoginViewController()
        controller.coordinator = self
        navigator = UINavigationController(rootViewController: controller)

        return navigator
    }

    func showValidation() {
        LoginVerificationCoordinator(navigator: navigator).start()
    }
}
