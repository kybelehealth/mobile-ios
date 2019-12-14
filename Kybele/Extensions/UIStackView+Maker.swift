//
//  UIStackView+Maker.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIStackView {

    static func make(arrangedSubViews: [UIView] = [],
                     axis: NSLayoutConstraint.Axis = .vertical,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill,
                     spacing: CGFloat = .leastNormalMagnitude) -> UIStackView {

        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}
