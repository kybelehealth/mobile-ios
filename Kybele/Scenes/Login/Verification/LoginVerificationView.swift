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

    // MARK: - Declaration

    private lazy var messageLabel: UILabel = .make(defaultText: "Please enter the code we’ve sent you via SMS.".localized(),
                                                   lines: 0)

    lazy var smsField: TextInputField = .init(type: .smsCode)

    lazy var button = UIButton.make(backgroundColor: .kybelePurple,
                                    title: "Continue".localized(),
                                    titleColor: .white,
                                    font: UIFont.boldSystemFont(ofSize: 20),
                                    cornerRadius: 24)

    // TODO: Delete this in production
    lazy var skipButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Skip (For Debug)", for: .normal)
        return view
    }()

    // TODO: Delete this in production
    private func addSkipButton() {
        addSubview(skipButton)
        skipButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(button.snp.top).offset(-16)
        }
    }

    // MARK: - Setup

    init() {
        super.init(frame: .zero)
        backgroundColor = .kybeleLightPurple

        let mainStack = UIStackView(arrangedSubviews: [messageLabel,
                                                       smsField])
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

        addSkipButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
