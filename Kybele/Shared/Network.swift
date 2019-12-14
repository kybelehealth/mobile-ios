//
//  Network.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class NetworkProvider {

    static let shared = NetworkProvider()

    let manager = SessionManager.default

    private let baseUrl = "http://192.168.86.247:3000/v1/"
    
    func login(phoneNumber: String) {
        let url = baseUrl + "users/login"
        manager.request(url).responseObject { (response: DataResponse<LoginResponse>) in
            
            if let response = response.result.value {
                let authyId = response.authyId
                
                // @TODO: Add this data to two factor auth call.
            }
        }
    }
    
    func twoFactorAuthLogin(authyId: String, code: String) {
        let url = baseUrl + "users/login/two-factor"
        manager.request(url).responseObject { (response: DataResponse<LoginTwoFactorResponse>) in
            if let response = response.result.value {
                let token = response.token
                let user = response.user
                
                // @TODO: Save token for storage.
            }
        }
    }
}
