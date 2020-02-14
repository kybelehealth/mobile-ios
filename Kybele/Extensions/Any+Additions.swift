//
//  Any+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 28.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation

public extension Optional where Wrapped: Any {

  func ifNil(_ value: @autoclosure () -> Wrapped) -> Wrapped {
    switch self {
    case .none:
      return value()
    case .some(let value):
      return value
    }
  }
}

//protocol OptionalString {}
//
//extension String: OptionalString {}
//
//extension Optional where Wrapped: OptionalString {
//
//    var isNilOrEmpty: Bool {
//        return ((self as? String) ?? .empty).isEmpty
//    }
//}
