//
//  HomepageViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class HomepageViewModel: ViewModel {

    let pageTitle: String = "KYBELE"

    let navigationItems: [HomepageNavigationItem] = [
        HomepageNavigationItem(
            name: "Calendar".localized(),
            iconImage: UIImage(named: "ico_calendar")!,
            destinationController: UIViewController()
        ),
        HomepageNavigationItem(
            name: "Health Profile".localized(),
            iconImage: UIImage(named: "ico_my_health_profile")!,
            destinationController: HealthProfileViewController(style: .plain)
        ),
        HomepageNavigationItem(
            name: "Health Records".localized(),
            iconImage: UIImage(named: "ico_my_health_records")!,
            destinationController: HealthRecordsViewController(style: .plain)
        ),
        HomepageNavigationItem(
            name: "Information Blog".localized(),
            iconImage: UIImage(named: "ico_health_information")!,
            destinationController: InformationBlogViewController()
        ),
        HomepageNavigationItem(
            name: "Nearby Health Centers".localized(),
            iconImage: UIImage(named: "ico_nearby_health_centers")!,
            destinationController: UIViewController()
        ),
        HomepageNavigationItem(
            name: "Emergency Button".localized(),
            iconImage: UIImage(named: "ico_emergency_button")!,
            destinationController: UIViewController()
        )
    ]
}

struct HomepageNavigationItem {

    let name: String
    let iconImage: UIImage
    let destinationController: UIViewController
}
