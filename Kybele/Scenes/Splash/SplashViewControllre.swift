//
//  SplashViewControllre.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {

    // MARK: - Properties
    private(set) var viewSource = SplashView()
    private(set) var viewModel: SplashViewModel

    // MARK: - Initialization
    init() {
        viewModel = SplashViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Life cycle
    override func loadView() {
        view = viewSource
        view.backgroundColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
