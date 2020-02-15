//
//  LoginVerificationView.swift
//  Kybele
//
//  Created by Rufat Mirza on 8.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit
import SnapKit

final class LoginVerificationView: UIView {

    private let messageLabel = UILabel.make(defaultText: "Please enter the code we’ve sent you via SMS.", lines: 0)

    let smsTextField: TextInputField = .init(placeholder: "Enter Code", contentType: .smsCode)

    let button = UIButton.make(backgroundColor: .kybelePurple,
                               title: "Continue",
                               titleColor: .white,
                               font: UIFont.boldSystemFont(ofSize: 20),
                               cornerRadius: 24)

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        let mainStack = UIStackView(arrangedSubviews: [messageLabel,
                                                       smsTextField])
        mainStack.spacing = 40
        mainStack.axis = .vertical

        addSubviews([mainStack, button])

        mainStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(safeAreaLayoutGuide.snp.topMargin).inset(24)
        }

        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
            $0.height.equalTo(48)
        }
        button.enableShadow()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
