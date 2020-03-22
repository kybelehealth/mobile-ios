//
//  LoginProfileViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 15.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginProfileViewController: UIViewController {

    var interactor: LoginProfileInteractor!
    private var viewSource: LoginProfileView!

    override func loadView() {
        viewSource = LoginProfileView()
        view = viewSource
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "LoginProfile"
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        viewSource.skipButton.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
    }
}

private extension LoginProfileViewController {

    @objc func buttonPressed() {
        
        let nameText = viewSource.nameField.validText()
        let surnameText = viewSource.surnameField.validText()
        let dateOfBirthText = viewSource.dateOfBirthField.validText()
        let addressText = viewSource.addressField.validText()

        guard
            let name = nameText,
            let surname = surnameText,
            let dateOfBirth = dateOfBirthText,
            let address = addressText
        else { return }

        interactor.submit()
        .done {
            self.interactor.coordinator.showLegalPages()
        }
        .cauterize()
    }

    @objc func skipButtonPressed() {
        interactor.coordinator.showLegalPages()
    }
}
