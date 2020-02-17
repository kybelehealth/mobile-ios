//
//  UIScrollView+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 17.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    static func makeBouncyScrollView() -> UIScrollView {
        let sv = UIScrollView()
        sv.alwaysBounceVertical = true
        return sv
    }
}
