//
//  LoginTwoFactorResponse.swift
//  Kybele
//
//  Created by yagiz on 12/14/19.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import ObjectMapper
import Foundation

struct LoginTwoFactorResponse: Mappable {
    var token: String?
    var user: User?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        token <- map["token"]
        user <- map["user"]
    }
}
