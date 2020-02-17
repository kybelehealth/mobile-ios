//
//  LoginView.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginView: UIView {

    // MARK: - Declaration

    private lazy var logo: UIImageView = .make(withName: "kybele_logo")

    lazy var emailField: TextInputField = .init("Enter Email".localized(), type: .email)

    lazy var phoneField: TextInputField = .init("Phone Number".localized(), type: .phone)

    lazy var button: UIButton = .make(backgroundColor: .kybelePurple,
                                      title: "Sign Up".localized(),
                                      titleColor: .white,
                                      font: UIFont.boldSystemFont(ofSize: 20),
                                      cornerRadius: 24)

    // MARK: - Setup

    init() {
        super.init(frame: .zero)

        let mainStack = UIStackView(arrangedSubviews: [logo,
                                                       emailField,
                                                       phoneField])
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
