//
//  UIImage+Maker.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIImageView {

    static func make(withName imageName: String? = nil,
                     isHidden: Bool = false,
                     contentMode: UIView.ContentMode = .scaleAspectFit,
                     interaction: Bool = false,
                     cornerRadius: CGFloat = 0) -> UIImageView {

        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.isHidden = isHidden
        iv.isUserInteractionEnabled = interaction
        iv.layer.cornerRadius = cornerRadius

        if let name = imageName {
            iv.image = UIImage(named: name)
        }

        iv.contentMode = contentMode
        return iv
    }
}
