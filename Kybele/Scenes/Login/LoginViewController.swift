//
//  LoginViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    private lazy var viewSource: LoginView = {
        let view = LoginView()
        return view
    }()

    private var viewModel: LoginViewModel

    // MARK: - Initialization

    init() {
        viewModel = LoginViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.startButton.addTarget(self, action: #selector(signupButtonPressed), for: .touchUpInside)
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
