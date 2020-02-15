//
//  AppInit.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

public struct AppInit {}

extension AppInit {

    var rootController: UIViewController {
        let didSkipOnboarding = UserDefaults.standard.bool(forKey: "onboardingShown")
        return didSkipOnboarding ? loginController : loginController
    }

    var onboardingController: UIViewController {
        return UIViewController() // OnboardingCoordinator().controller()
    }

    var homepageController: UIViewController {
        return HomepageCoordinator().controller()
    }

    var loginController: UIViewController {
        return LoginCoordinator().controller()
    }
}
