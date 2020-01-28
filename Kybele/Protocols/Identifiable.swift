//
//  Identifiable.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

protocol Identifiable {}

extension Identifiable {
    
    static var identifier: String { return String(describing: self) }
}

extension UITableViewCell: Identifiable {}

extension UICollectionViewCell: Identifiable {}
