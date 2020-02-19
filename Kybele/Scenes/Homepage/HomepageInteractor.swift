//
//  HomepageInteractor.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import PromiseKit
import UIKit

final class HomepageInteractor: Interactor {

    var coordinator: HomepageCoordinator!

    private let storage: Storage = .init()
    
    func start() -> Guarantee<[Item]> {
        return storage.navigationItems.guaranteed()
    }

    struct Item {
        let name: String
        let iconImage: UIImage
        let destination: UIViewController
    }
}

private extension HomepageInteractor {
    
    struct Storage {
        
        let navigationItems: [Item] = [
            Item(name: "Calendar".localized(),
                 iconImage: UIImage(named: "ico_calendar")!,
                 destination: UIViewController()
            ),
            Item(name: "Health Profile".localized(),
                 iconImage: UIImage(named: "ico_my_health_profile")!,
                 destination: HealthProfileViewController(style: .plain)
            ),
            Item(name: "Health Records".localized(),
                 iconImage: UIImage(named: "ico_my_health_records")!,
                 destination: HealthRecordsViewController(style: .plain)
            ),
            Item(name: "Information Blog".localized(),
                 iconImage: UIImage(named: "ico_health_information")!,
                 destination: InformationBlogViewController()
            ),
            Item(name: "Nearby Health Centers".localized(),
                 iconImage: UIImage(named: "ico_nearby_health_centers")!,
                 destination: UIViewController()
            ),
            Item(name: "Emergency Button".localized(),
                 iconImage: UIImage(named: "ico_emergency_button")!,
                 destination: UIViewController()
            )
        ]
    }
}

