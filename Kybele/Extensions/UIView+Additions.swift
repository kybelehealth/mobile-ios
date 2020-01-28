//
//  UIView+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIView {

    public func enableShadow(shadowOpacity: Float = 0.2, shadowRadius: CGFloat = 6) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}

extension UIView {

    func addLine() {
        let view = UIView()
        self.addSubview(view)
        view.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        view.backgroundColor = .kybelePurple
    }
}
