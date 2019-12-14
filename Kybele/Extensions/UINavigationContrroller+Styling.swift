//
//  UINavigationContrroller+Styling.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

extension UINavigationController {

    func setupStyling() {

        navigationBar.barStyle = .default
        navigationBar.tintColor = .black
        navigationBar.shadowImage = UIImage()
        navigationBar.shadowColor = UIColor(hex: 0x000000)
        navigationBar.shadowOpacity = 0.06
        navigationBar.shadowOffset = CGSize(width: 0, height: 2)
        navigationBar.shadowRadius = 4
        navigationBar.isTranslucent = false
    }
}
