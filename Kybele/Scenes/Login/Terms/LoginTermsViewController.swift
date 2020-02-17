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
        navigationItem.title = "LoginTerms"
        prepareContent()
    }
}

private extension LoginTermsViewController {

    @objc func prepareContent() {
        // Bind Interactor with PromiseKit
        
    }
}
