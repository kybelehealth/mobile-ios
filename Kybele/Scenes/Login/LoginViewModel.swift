//
//  LoginViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Alamofire

class LoginViewModel: ViewModel {

    func login(with email: String, phone: String) {

        let endpoint = APIConfig.login(email: email, phone: phone, languageId: 1)

        Service.shared.request(endpoint: endpoint) { (response: Result<LoginResponse>) in

            switch response {
            case .success(let model):

                if let authyId = model.authyId {
                    KeychainService.shared.set(value: authyId, key: .authyId)
                }

            case .failure:
                break
            }
        }
    }
}
