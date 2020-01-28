//
//  LoginView.swift
//  Kybele
//
//  Created by Rufat Mirza on 25.01.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginView: UIView {

    private let logoImageView = UIImageView.make(withName: "kybele_logo")

    let emailTextField: UITextField = {
        let view = UITextField()
        view.setPlaceHolderTextColor(.kybelePurple)
        view.attributedPlaceholder = NSAttributedString(string: "Enter Email",
                                                        attributes: [.foregroundColor: UIColor.gray])
        view.textColor = .kybelePurple
        view.keyboardType = .emailAddress
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.addLine()
        return view
    }()

    let phoneTextField: UITextField = {
        let view = UITextField()
        view.setPlaceHolderTextColor(.kybelePurple)
        view.textColor = .kybelePurple
        view.attributedPlaceholder = NSAttributedString(string: "Phone Number",
                                                        attributes: [.foregroundColor: UIColor.gray])
        view.keyboardType = .phonePad
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.addLine()
        return view
    }()

    let startButton = UIButton.make(backgroundColor: .kybelePurple,
                                    title: "Sign Up",
                                    titleColor: .white,
                                    font: UIFont.boldSystemFont(ofSize: 20),
                                    cornerRadius: 24)

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)

        emailTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }

        phoneTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }

        let mainStack = UIStackView(arrangedSubviews: [logoImageView,
                                                       emailTextField,
                                                       phoneTextField])
        mainStack.spacing = 40
        mainStack.axis = .vertical


        addSubviews([mainStack, startButton])

        mainStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(safeAreaLayoutGuide.snp.topMargin).inset(24)
        }

        startButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
            $0.height.equalTo(48)
        }
        startButton.enableShadow()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
