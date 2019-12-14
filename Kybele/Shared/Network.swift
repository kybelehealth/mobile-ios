//
//  Network.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import Alamofire

class NetworkProvider {

    static let shared = NetworkProvider()

    let manager = SessionManager.default

    static var baseUrl: String {
        get {
            return ""
        }
    }

    private static func createRequest(_ request: RequestDelegate) -> DataRequest {
        print("\n\nRequest Path: \(request.path)")
        print("Request Method: \(request.method.rawValue)")
        print("Request Parameters:")
        print(request.parameters ?? "nil")

        let request = Alamofire.request(baseUrl + request.path,
                                        method: request.method,
                                        parameters: request.parameters,
                                        encoding: URLEncoding.default,
                                        headers: nil)

        request.validate()
        request.responseData { (response) in
            if let value = response.result.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
        return request
    }

    static func request<T: Codable>(_ request: RequestDelegate, completionHandler: (Result<T>)) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                print("success")
//                success(ResponseArray<T>.decode(response.result.value!)!)
            case .failure:
                print("failure")
//                handleFailure(response: response, failure: failure)
            }
        }
    }
}

protocol RequestDelegate {

    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? {get set}

//    func didError( _ error: ResponseError)

}

extension RequestDelegate {

//    func didError(_ error: ResponseError) {}

}
