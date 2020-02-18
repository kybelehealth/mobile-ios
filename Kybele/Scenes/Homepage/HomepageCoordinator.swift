//
//  HomepageCoordinator.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class HomepageCoordinator: Coordinator {

    private weak var navigator: UINavigationController!

    func controller() -> UIViewController {
        let controller = HomepageViewController()
        controller.coordinator = self

        let navigator = UINavigationController(rootViewController: controller)
        defer { self.navigator = navigator }

        navigator.modalPresentationStyle = .fullScreen
        navigator.setupStyling()
        return navigator
    }
}
