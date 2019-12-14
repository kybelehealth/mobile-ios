//
//  ViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

protocol RemoteLoading {

}

protocol Navigator {

    associatedtype View: UIViewController = Self
}

class ViewModel: RemoteLoading, ErrorHandler {

}


protocol ErrorDisplayer {

}

extension ErrorDisplayer where Self: UIViewController {

//    var errorMessage: Binder<ErrorObject> {
//        return Binder.init(self, binding: { (controller, errorObject) in
//            let imageSize = CGSize(width: 40, height: 40)
//
//            var imageColor = UIColor(hex: 0x079992)!
//            var thumbnailImage = UIImage.init(icon: .icofont(.checkCircled), size: imageSize, textColor: imageColor)
//
//            if errorObject.warningType != .success {
//                let isError = errorObject.warningType == .error
//                imageColor = isError ? UIColor(hex: 0xeb2f06)! : UIColor(hex: 0xe58e26)!
//                thumbnailImage = UIImage.init(icon: .icofont(.exclamationCircle), size: imageSize, textColor: imageColor)
//            }
//
//            let title = EKProperty.LabelContent(
//                text: errorObject.errorTitle,
//                style: .init(
//                    font: UIFont.bold(18),
//                    color: .black,
//                    displayMode: .inferred
//                ),
//                accessibilityIdentifier: "title"
//            )
//            let description = EKProperty.LabelContent(
//                text: errorObject.errorDescription,
//                style: .init(
//                    font: UIFont.regular(16),
//                    color: .black,
//                    displayMode: .inferred
//                ),
//                accessibilityIdentifier: "description"
//            )
//            let image: EKProperty.ImageContent = EKProperty.ImageContent(
//                image: thumbnailImage.withRenderingMode(.alwaysTemplate),
//                displayMode: .inferred,
//                size: imageSize,
//                tint: EKColor(imageColor),
//                accessibilityIdentifier: "thumbnail"
//            )
//            let simpleMessage = EKSimpleMessage(
//                image: image,
//                title: title,
//                description: description
//            )
//            let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
//            let contentView = EKNotificationMessageView(with: notificationMessage)
//            var attributes = EKAttributes.topToast
//            attributes.entryBackground = .visualEffect(style: .init(style: .extraLight))
//            attributes.displayDuration = 4
//            SwiftEntryKit.display(entry: contentView, using: attributes)
//        })
//    }

}
