//
//  AppInit.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

public struct AppInit {

}

extension AppInit {

    var rootController: UIViewController {

        //        if let _ = AppUser.value {
        //            return welcomeController
        //        }

        let didSkipOnboarding = UserDefaults.standard.bool(forKey: "onboardingShown")

        return didSkipOnboarding ? loginController : loginController
    }

    var onboardingController: UINavigationController {
        let controller = LoginViewController() // TODO: Fix to actual Onboarding Controller
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setupStyling()

        return navigationController
    }

    var homepageController: UIViewController {
        let controller = HomepageViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setupStyling()
        return navigationController
    }

    var loginController: UIViewController {
        return LoginCoordinator().controller()
    }
}
