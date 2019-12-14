//
//  InformationBlogView.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class InformationBlogView: UIView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Sizes.homepageInteritemSpace
        layout.minimumInteritemSpacing = Sizes.homepageInteritemSpace
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        cv.backgroundColor = .white
        cv.register(InformationBlogCell.self, forCellWithReuseIdentifier: InformationBlogCell.identifier)
        return cv
    }()

    init() {
        super.init(frame: .zero)

        addSubviews([collectionView])

        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
