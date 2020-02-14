//
//  UIBarButtonItem+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    convenience init(barButtonSystemItem: UIBarButtonItem.SystemItem) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
    }
}
