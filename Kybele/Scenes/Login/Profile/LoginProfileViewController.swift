//
//  LoginProfileViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 15.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginProfileViewController: UIViewController {

    var coordinator: LoginProfileCoordinator!

    private var viewModel: LoginProfileViewModel!
    private var viewSource: LoginProfileView!

    override func loadView() {
        viewModel = LoginProfileViewModel()
        viewSource = LoginProfileView()
        view = viewSource
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "LoginProfile"
    }
}
