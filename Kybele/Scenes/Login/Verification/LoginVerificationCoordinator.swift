//
//  LoginVerificationCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 13.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginVerificationCoordinator: Coordinator {

    var navigator: UINavigationController!

    func start(navigator: UINavigationController) {
        self.navigator = navigator

        let controller = LoginVerificationViewController()
        controller.coordinator = self

        navigator.pushViewController(controller)
    }
}
