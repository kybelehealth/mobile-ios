//
//  Endpoint.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation
import Alamofire

struct URLKeys {

    static let baseURL = "https://api.kybelehealth.org/"
}

enum APIConfig: URLRequestConvertible {

    case login(email: String, phone: String, languageId: Int)
    case register

    private var method: HTTPMethod {
        switch self {
        case .login         : return .post
        case .register      : return .post
        }
    }

    var path: String {
        switch self {
        case .login: return "v1/users/login"
        case .register: return "v1/users/register"
        }
    }

    private var params: Parameters? {
        switch self {

        case .login(let phone, let email, let languageId):

            return ["phoneNumber": phone,
                    "LanguageId": languageId,
                    "email": email]

        case .register:
            return nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try URLKeys.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        urlRequest.httpMethod = method.rawValue

        if let parameters = params {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
