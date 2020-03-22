//
//  LoginTermsCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 17.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginTermsCoordinator: Coordinator {
    
    private weak var navigator: UINavigationController!
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let controller = LoginTermsViewController()
        controller.interactor = LoginTermsInteractor()
        controller.interactor.coordinator = self

        navigator.pushViewController(controller)
    }

    func close() {
        navigator.dismiss(animated: true)
    }
}
