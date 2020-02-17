//
//  Service.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Alamofire
import Foundation
import PromiseKit

public typealias Result = AFResult

public final class Service {

    static let shared: Service = .init()

    func request<T: Codable>(_ endpoint: APIConfig) -> Promise<T> {
        let request = try! endpoint.asURLRequest()
        return AF.request(request).validate().responseModel()
    }

//    func request<T: Codable>(endpoint: APIConfig, callback: @escaping (Result<T>) -> Void ) {
//        let request = try! endpoint.asURLRequest()
//        AF.request(request).validate().responseModel(completion: callback)
//    }
}

public extension DataRequest {

//    func responseModel<T: Codable>(completion: @escaping (Result<T>) -> Void) {
//        responseData { response in
//            if let data = response.data, let model = try? JSONDecoder().decode(T.self, from: data) {
//                completion(.success(model))
//            } else {
//                completion(.failure(.responseValidationFailed(reason: .dataFileNil)))
//            }
//        }
//    }

    func responseModel<T: Codable>() -> Promise<T> {

        return Promise { seal in
            responseData { response in
                if let data = response.data, let model = try? JSONDecoder().decode(T.self, from: data) {
                    seal.fulfill(model)
                } else {
                    seal.reject(Error.cannotDecode)
                }
            }
        }
    }

    enum Error: Swift.Error {
        case cannotDecode
    }
}

public enum ErrorType: Error {
    case apiError

    var localizedDescription: String {
        switch self {
        case .apiError:
            return "API Error"
        }
    }
}

