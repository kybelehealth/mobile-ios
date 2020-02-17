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
    }
}

private extension LoginVerificationViewController {

    var code: String? {
        let text = viewSource.smsField.text.ifNil(.empty)
        if text.count < TextInputContent.smsCode.minLength {
            viewSource.smsField.invalidate()
            return nil
        }
        return text
    }

    @objc func buttonPressed() {
        guard let code = code else { return }

        interactor.verify(with: code)
        .done {
            self.interactor.coordinator.showProfileEditor()
        }
        .cauterize()
    }
}
