//
//  NewRecordView.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class NewRecordView: UIView {

    private let button = UIButton.make(horizontalAlignment: .center, verticalAlignment: .center, backgroundColor: .purple, title: "Add New", titleColor: .white, font: .boldSystemFont(ofSize: 20), cornerRadius: 24)

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        shadowOffset = CGSize(width: 0, height: 2)
        shadowColor = UIColor.black
        shadowOpacity = 0.1
        shadowRadius = 6

        addSubview(button)

        button.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

