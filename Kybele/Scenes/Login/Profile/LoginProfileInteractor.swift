//
//  LoginProfileInteractor.swift
//  Kybele
//
//  Created by Rufat Mirza on 15.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import PromiseKit
import UIKit

final class LoginProfileInteractor: Interactor {

    var coordinator: LoginProfileCoordinator!

    func submit() -> Promise<Void> {
        return Promise().asVoid()
    }
}
