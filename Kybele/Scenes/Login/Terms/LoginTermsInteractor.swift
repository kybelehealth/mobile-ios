//
//  LoginTermsInteractor.swift
//  Kybele
//
//  Created by Rufat Mirza on 17.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginTermsInteractor: Interactor {

    var coordinator: LoginTermsCoordinator!
    private lazy var storage: Storage = .empty
    
}

// MARK: - Storage

private extension LoginTermsInteractor {

  struct Storage {

    static let empty = Storage()
  }
}
