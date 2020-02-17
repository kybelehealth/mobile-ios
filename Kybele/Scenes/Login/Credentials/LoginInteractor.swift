//
//  LoginInteractor.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Alamofire
import PromiseKit

final class LoginInteractor: Interactor {

    var coordinator: LoginCoordinator!

    func login(with email: String, phone: String) -> Promise<LoginResponse> {
        let endpoint = APIConfig.login(email: email, phone: phone, languageId: 1)
        return Service.shared.request(endpoint)
    }
}
