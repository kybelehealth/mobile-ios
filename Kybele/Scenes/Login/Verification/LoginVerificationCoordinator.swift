//
//  LoginVerificationCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 13.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginVerificationCoordinator: Coordinator {

    private weak var navigator: UINavigationController!

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start(with authId: String) {
        let controller = LoginVerificationViewController()
        controller.interactor = LoginVerificationInteractor(with: authId)
        controller.interactor.coordinator = self
        navigator.pushViewController(controller)
    }

    func showProfileEditor() {
        LoginProfileCoordinator(navigator: navigator).start()
    }
}
