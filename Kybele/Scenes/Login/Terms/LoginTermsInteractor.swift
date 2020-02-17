//
//  LoginTermsInteractor.swift
//  Kybele
//
//  Created by Rufat Mirza on 17.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import PromiseKit
import UIKit

final class LoginTermsInteractor: Interactor {

    var coordinator: LoginTermsCoordinator!
    
    func start() -> Promise<NSAttributedString> {
        return Promise { $0.fulfill(legal_personal) }
    }
    
    var legal_personal: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "Protection of Personal Data (KVKK)",
                                                         attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .semibold)])
        
        attributedString.append(NSAttributedString(string: "Lorem ipsum dolor sit amet, dolor sit consectetur adipiscing elit. Lorem ipsum dolor sit amet, dolor sit consectetur adipiscing elit. Lorem ipsum dolor sit amet, dolor sit consectetur adipiscing elit. Lorem ipsum dolor sit amet, dolor sit consectetur adipiscing elit. Lorem ipsum dolor sit amet"))
        
        return attributedString
    }
}
