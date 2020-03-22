//
//  LoginVerificationViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 8.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginVerificationViewController: UIViewController {

    var interactor: LoginVerificationInteractor!
    private var viewSource: LoginVerificationView!

    override func loadView() {
        viewSource = LoginVerificationView()
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Code".localized()
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        viewSource.skipButton.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
    }
}

private extension LoginVerificationViewController {

    @objc func buttonPressed() {
        
        let codeText = viewSource.smsField.validText()
        
        guard let code = codeText else { return }

        interactor.verify(with: code)
        .done {
            self.interactor.coordinator.showProfileEditor()
        }
        .cauterize()
    }

    @objc func skipButtonPressed() {
        interactor.coordinator.showProfileEditor()
    }
}
