//
//  LoginTermsViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 17.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginTermsViewController: UIViewController {

    var interactor: LoginTermsInteractor!
    private var viewSource: LoginTermsView!

    override func loadView() {
        viewSource = LoginTermsView()
        view = viewSource
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.startLoadingIndicatorView()
        navigationItem.title = "Personal Data"
        prepareContent()
        viewSource.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

private extension LoginTermsViewController {

    func prepareContent() {
        interactor.start().done { [weak self] display in
            self?.viewSource.body.attributedText = display
        }.ensure { [weak self] in
            self?.view.stopLoadingIndicatorView()
        }
        .cauterize()
    }
}

private extension LoginTermsViewController {

    @objc func buttonPressed() {
        interactor.coordinator.close()
        AuthenticationService.shared.authenticate()
    }
}
