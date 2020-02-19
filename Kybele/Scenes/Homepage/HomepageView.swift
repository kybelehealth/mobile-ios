//
//  HomepageView.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class HomepageView: UIView {

    // MARK: - Declaration

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Sizes.homepageInteritemSpace
        layout.minimumInteritemSpacing = Sizes.homepageInteritemSpace
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        cv.backgroundColor = .white
        cv.register(HomepageCell.self, forCellWithReuseIdentifier: HomepageCell.identifier)
        return cv
    }()

    private let notificationsButton: UIButton = .make(numberOfLines: 1, horizontalAlignment: .center, verticalAlignment: .center, backgroundColor: .clear, image: UIImage(named: "ico_notifications")?.withRenderingMode(.alwaysOriginal), titleColor: .black, font: .boldSystemFont(ofSize: 12))

    private let profileButton: UIButton = .make(numberOfLines: 1, horizontalAlignment: .center, verticalAlignment: .center, backgroundColor: .clear, image: UIImage(named: "ico_profile")?.withRenderingMode(.alwaysOriginal), titleColor: .black, font: .systemFont(ofSize: 12))

    private lazy var rightBarButtonStack: UIStackView = .make(arrangedSubViews: [notificationsButton, profileButton], axis: .horizontal, alignment: .center, spacing: 12)


    lazy var rightBarButtonItem: UIBarButtonItem = .init(customView: rightBarButtonStack)

    private let languageButton: UIButton = .make(numberOfLines: 1, horizontalAlignment: .center, verticalAlignment: .center, backgroundColor: .clear, title: "Language", titleColor: .black, font: .systemFont(ofSize: 17))

    lazy var leftBarButtonItem: UIBarButtonItem = .init(customView: languageButton)


    // MARK: - Setup

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
