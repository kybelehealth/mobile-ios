//
//  NotificationCenter+Additions.swift
//  Kybele
//
//  Created by Rufat Mirza on 18.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import Foundation

extension NotificationCenter {

    static let services = NotificationCenter()

    func enqueue(name: Notification.Name,
                 object: Any? = nil,
                 userInfo: [Notification.UserInfoKey: Any]? = nil) {

        let queue = NotificationQueue(notificationCenter: self)
        let notification = name.notification(object: object, userInfo: userInfo)

        queue.enqueue(notification, postingStyle: .asap, coalesceMask: .onName, forModes: .none)
    }
}

extension Notification.Name {

    func notification(object: Any? = nil,
                      userInfo: [Notification.UserInfoKey: Any]? = nil) -> Notification {
        return Notification(name: self, object: object, userInfo: userInfo)
    }
}
