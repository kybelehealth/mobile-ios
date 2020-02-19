//
//  LoginVerificationInteractor.swift
//  Kybele
//
//  Created by Rufat Mirza on 8.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation
import PromiseKit

final class LoginVerificationInteractor: Interactor {

    var coordinator: LoginVerificationCoordinator!

    private let storage: Storage

    init(with authId: String) {
        storage = Storage(authyId: authId)
    }

    func verify(with code: String?) -> Promise<Void> {

        // TODO: Make network call with `code` and `authyId` from Storage
        let verification: Promise<Void> = Promise { seal in
            return seal.fulfill_()
        }

        return verification
    }
}

private extension LoginVerificationInteractor {

  struct Storage {
      let authyId: String
  }
}
