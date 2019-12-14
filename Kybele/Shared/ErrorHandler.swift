//
//  ErrorHandler.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import Alamofire

struct ErrorObject {
    let warningType: WarningType
    let errorTitle: String
    let errorDescription: String

    enum WarningType {
        case error, warning, success
    }
}

protocol ErrorHandler {
    func handleError(error: Error) -> ErrorObject
}

extension ErrorHandler where Self: ViewModel {
    func handleError(error: Error) -> ErrorObject {
        let networkError = error as? AFError

        switch networkError?.responseCode {
        case 412:
            return ErrorObject(warningType: .warning, errorTitle: "Validation Error", errorDescription: "Resource already exists. Precondition failed.")
        case 404:
            return ErrorObject(warningType: .error, errorTitle: "Not Found", errorDescription: "Resource not found.")
        default:
            return ErrorObject(warningType: .error, errorTitle: "Error", errorDescription: "Uncaught exception. Please contact us.")
        }
    }
}
