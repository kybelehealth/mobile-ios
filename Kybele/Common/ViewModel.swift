//
//  ViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

protocol RemoteLoading {

}

protocol Navigator {

    associatedtype View: UIViewController = Self
}

class ViewModel: RemoteLoading, ErrorHandler {

}


protocol ErrorDisplayer {

}

extension ErrorDisplayer where Self: UIViewController {

}
