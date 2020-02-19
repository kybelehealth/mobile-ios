//
//  HomepageCell.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class HomepageCell: UICollectionViewCell {

    // MARK: - Properties

    private let nameLabel = UILabel.make(ofSize: 20, strong: true, lines: 0, color: .purple, lineHeightMultiple: 1.25)

    private let iconImageView = UIImageView.make()

    // MARK: - Initialization
    
    override init(frame: CGRect) {

        super.init(frame: frame)

        addSubviews([nameLabel, iconImageView])

        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(12)
        }

        iconImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.height.equalTo(63)
            $0.width.equalTo(66)
        }

        backgroundColor = .white
        layer.cornerRadius = 12
        shadowOffset = CGSize(width: 0, height: 0)
        shadowColor = UIColor.black
        shadowOpacity = 0.1
        shadowRadius = 6
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate HomepageCell

extension HomepageCell {

    func populate(with item: HomepageInteractor.Item) {
        iconImageView.image = item.iconImage
        nameLabel.text = item.name
    }
}
