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
    }
}

private extension LoginProfileViewController {

    @objc func buttonPressed() {
        
        var nameText = viewSource.nameField.validText()
        var surname = viewSource.surnameField.validText()
        var address = viewSource.addressField.validText()
        
        interactor.submit()
        .done {
            self.interactor.coordinator.showLegalPages()
        }
        .cauterize()
    }
}
