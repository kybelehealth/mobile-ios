//
//  LoginVerificationViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 8.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginVerificationViewController: UIViewController {

    var coordinator: LoginVerificationCoordinator!

    private var viewModel: LoginVerificationViewModel!
    private var viewSource: LoginVerificationView!

    override func loadView() {
        viewModel = LoginVerificationViewModel()
        viewSource = LoginVerificationView()
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Password".localized()
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addViewModelObserver()
    }
}

private extension LoginVerificationViewController {

    @objc func buttonPressed() {
        guard let code = viewSource.smsTextField.text else {
            return
        }

        viewModel.verify(with: code)
    }
}

private extension LoginVerificationViewController {

    @objc func addViewModelObserver() {
        viewModel.handler = {
            self.coordinator.showProfileEditor()
        }
    }
}
