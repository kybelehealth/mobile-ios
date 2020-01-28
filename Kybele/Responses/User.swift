//
//  User.swift
//  Kybele
//
//  Created by yagiz on 12/14/19.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import Foundation
//import ObjectMapper

struct User: Codable, Identifiable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var gender: String?
    var birthDate: String?
    var email: String?
    var lastPeriodDate: String?
    var Language: Language?
    
//    init?(map: Map) {}
//    
//    mutating func mapping(map: Map) {
//        id <- map["id"]
//        firstName <- map["firstName"]
//        lastName <- map["lastName"]
//        phoneNumber <- map["phoneNumber"]
//        gender <- map["gender"]
//        birthDate <- map["birthDate"]
//        email <- map["email"]
//        lastPeriodDate <- map["lastPeriodDate"]
//        Language <- map["Language"]
//    }
}
