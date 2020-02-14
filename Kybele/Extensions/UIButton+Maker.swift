//
//  UIButton+Maker.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIButton {

    static func make(numberOfLines: Int = 1,
                     horizontalAlignment: UIControl.ContentHorizontalAlignment = .center,
                     verticalAlignment: UIControl.ContentVerticalAlignment = .center,
                     backgroundColor: UIColor = .clear,
                     backgroundImage: UIImage? = nil,
                     image: UIImage? = nil,
                     title: String = .empty,
                     titleColor: UIColor = .black,
                     font: UIFont = .boldSystemFont(ofSize: 17.0),
                     cornerRadius: CGFloat = 0) -> UIButton {

        let button = UIButton(type: .custom)
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = backgroundColor
        button.contentHorizontalAlignment = horizontalAlignment
        button.contentVerticalAlignment = verticalAlignment
        button.setTitleColor(titleColor, for: .normal)
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.setImage(image, for: .normal)
        button.titleLabel?.font = font
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = cornerRadius
        return button
    }
}
