//
//  InformationBlogCell.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class InformationBlogCell: UICollectionViewCell {

    // MARK: - Properties

    private let titleLabel = UILabel.make(ofSize: 20, strong: true, lines: 0)

    private let bodyLabel = UILabel.make(ofSize: 14, lines: 0)

    private lazy var stackView: UIStackView = .make(arrangedSubViews: [titleLabel, bodyLabel],
                                                    axis: .vertical,
                                                    spacing: 8)

    private let iconImageView = UIImageView.make()


    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}

extension InformationBlogCell {


    func configure(with item: InformationBlog) {
        titleLabel.text = item.name
        bodyLabel.text = item.body
    }
}

