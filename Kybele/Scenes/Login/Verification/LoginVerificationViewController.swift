//
//  LoginVerificationViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 8.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

class LoginVerificationViewController: UIViewController {

    var coordinator: LoginVerificationCoordinator!

    private lazy var viewSource: LoginVerificationView = {
        let view = LoginVerificationView()
        return view
    }()

    private var viewModel: LoginVerificationViewModel = .init()

    override func loadView() {
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Password"
    }
}
