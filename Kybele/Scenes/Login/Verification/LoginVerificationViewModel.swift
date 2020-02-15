//
//  LoginVerificationViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 8.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation

final class LoginVerificationViewModel: ViewModel {

    var handler: () -> Void = {}

    func verify(with code: String?) {

        guard let code = code else { return }

        handler()

        // TODO: Network Code
    }
}
