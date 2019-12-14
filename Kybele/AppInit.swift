//
//  AppInit.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

struct AppInit {

}

// MARK: - External Workers
extension AppInit {

    var rootController: UIViewController {
        let didSkipOnboarding = UserDefaults.standard.bool(forKey: "onboardingShown")

//        if let _ = AppUser.value {
//            return welcomeController
//        }

//        return didSkipOnboarding ? loginController : onboardingController
        return homepageController
    }

//  var onboardingController: UINavigationController {
//      let controller = OnboardingViewController()
//      let navigationController = UINavigationController(rootViewController: controller)
//      navigationController.setupStyling()
//
//      controller.completionObservable
//          .asObservable()
//          .subscribe(onNext: { _ in
//              self.rootControllerDefinedObserver.onNext(self.loginController)
//          })
//          .disposed(by: controller.bag)
//
//      return navigationController
//  }

    //  var loginController: UINavigationController {
    //      let controller = LoginViewController()
    //      let navigationController = UINavigationController(rootViewController: controller)
    //      navigationController.setupStyling()
    //
    //      controller.completionObservable
    //          .asObservable()
    //          .subscribe(onNext: { _ in
    //              self.rootControllerDefinedObserver.onNext(self.welcomeController)
    //          })
    //          .disposed(by: controller.bag)
    //
    //      return navigationController
    //  }


//  var welcomeController: UIViewController {
//      let controller = WelcomeViewController()
//
//      controller.completionObservable
//          .asObservable()
//          .subscribe(onNext: { _ in
//              self.rootControllerDefinedObserver.onNext(self.homepageController)
//          })
//          .disposed(by: controller.bag)
//
//      return controller
//  }

  var homepageController: UIViewController {
      let controller = HomepageViewController()
      let navigationController = UINavigationController(rootViewController: controller)
      navigationController.setupStyling()
      return navigationController
  }

}
