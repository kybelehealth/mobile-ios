//
//  LoginViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Alamofire

final class LoginViewModel: ViewModel {

    var handler: () -> Void = {}

    func login(with email: String?, phone: String?) {

        guard
            let email = email,
            let phone = phone
            else { return }

        let endpoint = APIConfig.login(email: email, phone: phone, languageId: 1)

        handler()

//        Service.shared.request(endpoint: endpoint) { [weak self] (response: Result<LoginResponse>) in
//
//            switch response {
//            case .success(let model):
//
//                if let authyId = model.authyId {
//                    KeychainService.shared.set(value: authyId, key: .authyId)
//                    self?.handler()
//                }
//
//            case .failure:
//                // TODO: Handle errors
//                break
//            }
//        }
    }
}
