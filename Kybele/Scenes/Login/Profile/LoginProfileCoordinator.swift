//
//  LoginProfileCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 15.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginProfileCoordinator: Coordinator {

    private weak var navigator: UINavigationController!

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {

        let controller = LoginProfileViewController()
        controller.coordinator = self

        navigator.pushViewController(controller)
    }
}
