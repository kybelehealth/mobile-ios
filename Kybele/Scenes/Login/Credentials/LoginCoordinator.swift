//
//  LoginCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 13.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginCoordinator: Coordinator {

    private weak var navigator: UINavigationController!

    func controller() -> UIViewController {
        let controller = LoginViewController()
        controller.interactor = LoginInteractor()
        controller.interactor.coordinator = self

        let navigator = UINavigationController(rootViewController: controller)
        defer { self.navigator = navigator }
        navigator.modalPresentationStyle = .fullScreen
        
        navigator.setupStyling()
        return navigator
    }

    func showValidation(with authId: String) {
        LoginVerificationCoordinator(navigator: navigator).start(with: authId)
    }

    func close() {
        navigator.dismiss(animated: true)
    }
}
