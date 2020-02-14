//
//  LoginViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var coordinator: LoginCoordinator!

    // MARK: - Properties

    private lazy var viewSource: LoginView = {
        let view = LoginView()
        return view
    }()

    private var viewModel: LoginViewModel = .init()

    // MARK: - Initialization

    override func loadView() {
        view = viewSource
        addObserver()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.button.addTarget(self, action: #selector(signupButtonPressed), for: .touchUpInside)
    }
}

extension LoginViewController {

    @objc private func signupButtonPressed() {

        guard
            let email = viewSource.emailTextField.text,
            let phone = viewSource.phoneTextField.text else
        {
            return
        }

        viewModel.login(with: email, phone: phone)
    }
}

extension LoginViewController {

    @objc private func addObserver() {
        viewModel.handler = {
            self.coordinator.showValidation()
        }
    }
}
