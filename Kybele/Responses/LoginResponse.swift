//
//  LoginResponse.swift
//  Kybele
//
//  Created by yagiz on 12/14/19.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import ObjectMapper
import Foundation

struct LoginResponse: Mappable {
    var authyId: Int?
    var message: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        authyId <- map["authyId"]
        message <- map["message"]
    }
}
