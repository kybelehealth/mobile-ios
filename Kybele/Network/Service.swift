//
//  Service.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation
import Alamofire

public typealias Result = AFResult

public final class Service {

    static let shared: Service = .init()

    func request<T: Codable>(endpoint: APIConfig, callback: @escaping (Result<T>) -> Void ) {
        let request = try! endpoint.asURLRequest()
        AF.request(request).validate().responseModel(completion: callback)
    }
}

public extension DataRequest {

    func responseModel<T: Codable>(completion: @escaping (Result<T>) -> Void) {
        responseData { response in
            if let data = response.data, let model = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(model))
            } else {
                completion(.failure(.responseValidationFailed(reason: .dataFileNil)))
            }
        }
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

