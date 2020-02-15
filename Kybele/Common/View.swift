//
//  View.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

protocol View {
    associatedtype VM: ViewModel
    associatedtype VS: UIView
    var viewSource: VS { get }
    var viewModel: VM { get }
}
