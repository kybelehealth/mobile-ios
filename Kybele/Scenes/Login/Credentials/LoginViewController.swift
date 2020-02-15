//
//  LoginViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    var coordinator: LoginCoordinator!

    private var viewModel: LoginViewModel!
    private var viewSource: LoginView!

    override func loadView() {
        viewModel = LoginViewModel()
        viewSource = LoginView()
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addViewModelObserver()
    }
}

private extension LoginViewController {

    @objc func buttonPressed() {

        guard
            let email = viewSource.emailTextField.text,
            let phone = viewSource.phoneTextField.text else
        {
            return
        }

        viewModel.login(with: email, phone: phone)
    }
}

private extension LoginViewController {

    @objc func addViewModelObserver() {
        viewModel.handler = {
            self.coordinator.showValidation()
        }
    }
}
