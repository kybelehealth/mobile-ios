//
//  PromiseKit.swift
//  Kybele
//
//  Created by Rufat Mirza on 19.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import PromiseKit

protocol Promiseable {}

extension Array: Promiseable {}

extension Promiseable {
    
    func fulfilled() -> PromiseKit.Promise<Self> {
        return PromiseKit.Promise { $0.fulfill(self) }
    }
    
    func guaranteed() -> PromiseKit.Guarantee<Self> {
        return PromiseKit.Guarantee { $0(self) }
    }
}
