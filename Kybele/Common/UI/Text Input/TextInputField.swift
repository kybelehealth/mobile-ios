//
//  TextInputField.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

class TextInputField: UIView, UITextFieldDelegate, Invalidable {

    // MARK: API

    weak var delegate: UITextFieldDelegate?

    var onChangeTextField: (String?) -> Void = { _ in }


    func invalidate() {
        isValid = false
    }

    var text: String? {
        get {
            return (input.text == placeholder) ? nil : input.text
        } set {

            if initialValue == nil {
                initialValue = newValue
            }

            if newValue.isNilOrEmpty {
                styleAsPlaceholder()
            } else {
                styleAsUserInput()
                input.text = newValue
            }
        }
    }

    func remaskTextField() {
        if input.text != placeholder {
            textFieldDidChange(input)
        }
    }

    func resignKeyboard() {
        input.resignFirstResponder()
    }

    internal var isValid = true {
        didSet {
            setValidation()
        }
    }

    private var initialValue: String?

    private var placeholder: String

    private var contentType: TextInputContent

    private let input = UITextField()

    private let hintLabel = UILabel.make(ofSize: 12, alignment: .right, lines: 2, color: .gray, isHidden: true)

    private let line = UIView()


    // MARK: View Lifecycle

    init(_ placeholder: String = .empty, type: TextInputContent = .none) {

        self.placeholder = placeholder
        self.contentType = type
        self.hintLabel.text = type.hint

        super.init(frame: .zero)

        hintLabel.text = type.hint

        backgroundColor = .white

        input.inputAccessoryView = KeyboardAccessoryView(for: input)

        setupViews()

        styleAsPlaceholder()

        setupTextField()

        input.autocapitalizationType = .none
        input.autocorrectionType = .no
        input.spellCheckingType = .no

        input.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        setValidation()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

        addSubviews([input, line])
        input.addSubview(hintLabel)

        input.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(36)
        }

        hintLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalTo(input)
            $0.leading.equalTo(input.snp.centerX)
        }

        line.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    private func setupTextField() {
        input.delegate = self
        input.keyboardType = contentType.keyboardType
        input.isSecureTextEntry = contentType.isSecureTextEntry
    }

    private func styleAsUserInput() {
        input.text = .empty
        input.textColor = .kybelePurple
    }

    private func styleAsPlaceholder() {
        input.text = placeholder
        input.textColor = .gray
    }
}

// MARK: - Validation

extension TextInputField {

    private func setValidation() {
        if isValid {
            setStyleValid()
        } else {
            setStyleInvalid()
        }
    }

    private func setStyleValid() {
        hintLabel.isHidden = true
        line.backgroundColor = .kybelePurple
        input.textColor = .kybelePurple
    }

    private func setStyleInvalid() {
        hintLabel.isHidden = false
        line.backgroundColor = .red
        input.textColor = .red
    }
}

// MARK: Text Field Delegate Methods

extension TextInputField {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        guard let text = textField.text else { return true }

        let newLength = text.count + string.count - range.length

        switch contentType {
        case .email:
            if string == .whitespace { return false }

        default:
            break
        }

        return newLength <= contentType.maxLength
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {

        isValid = true

        guard textField.text == placeholder else { return }

        styleAsUserInput()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        text = textField.text
        delegate?.textFieldDidEndEditing?(textField)
    }

    @objc private func textFieldDidChange(_ tf: UITextField) {

        guard let text = tf.text else { return }

        onChangeTextField(tf.text)

        if contentType == .phone {

            if let mask = contentType.mask {
                input.text = text.formatNumber(with: mask)
            }
        }
    }
}
