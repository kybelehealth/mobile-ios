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

    override func loadView() {
        viewSource = LoginView()
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

private extension LoginViewController {

    var phone: String? {
        let text = viewSource.phoneField.text.ifNil(.empty)
        if text.count < TextInputContent.phone.minLength {
            viewSource.phoneField.invalidate()
            return nil
        }
        return text
    }

    var email: String? {
        let text = viewSource.emailField.text.ifNil(.empty)
        if !text.isValidEmail {
            viewSource.emailField.invalidate()
            return nil
        }
        return text
    }

    @objc func buttonPressed() {

        guard let email = email, let phone = phone else { return }

        interactor.login(with: email, phone: phone)
        .done { [weak self] response in
            self?.interactor.coordinator.showValidation(with: response.authyId!)
        }
        .cauterize()
    }
}
