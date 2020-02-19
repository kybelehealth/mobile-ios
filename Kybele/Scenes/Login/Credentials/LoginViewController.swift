//
//  LoginViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    var interactor: LoginInteractor!

    private var viewSource: LoginView!

    private let authenticator: AuthenticationService = .shared

    override func loadView() {
        viewSource = LoginView()
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    deinit {
        print("#function")
    }
}

private extension LoginViewController {

    @objc func buttonPressed() {

//        authenticator.authenticate()

        let phoneText = viewSource.phoneField.validText()
        let emailText = viewSource.emailField.validText()

        guard
            let email = emailText,
            let phone = phoneText else { return }

        interactor.login(with: email, phone: phone)
        .done { [weak self] response in
            self?.interactor.coordinator.showValidation(with: "123456")
        }
        .cauterize()
    }
}
