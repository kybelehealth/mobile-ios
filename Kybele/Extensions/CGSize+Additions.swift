//
//  CGSize+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

extension CGSize {
    
    var toRect: CGRect {
        return CGRect(origin: .zero, size: self)
    }
    
    init(size: CGFloat) {
        self.init(width: size, height: size)
    }
}
