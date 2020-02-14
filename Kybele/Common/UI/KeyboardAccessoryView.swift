//
//  KeyboardAccessoryView.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

class KeyboardAccessoryView: UIView {

    private weak var textField: UITextField?

    convenience init(for textField: UITextField?) {
        self.init(frame: CGSize(width: UIScreen.main.bounds.size.width, height: 44).toRect)

        self.textField = textField
        self.configure()
    }

    private func configure() {
        let toolBar = UIToolbar(frame: CGSize(size: 44.0).toRect)
        toolBar.isTranslucent = false
        addSubview(toolBar)
        toolBar.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        let toolBarItems: [UIBarButtonItem] = doneItems

        toolBar.setItems(toolBarItems, animated: true)
        layoutIfNeeded()
    }

    @objc private func doneButtonTapped() {
        textField?.endEditing(true)
    }
}

// MARK: - UIBarButtonItems

private extension KeyboardAccessoryView {

    var doneItems: [UIBarButtonItem] {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace)

        let doneButton = UIBarButtonItem(
            title: "Done", style: .done, target: self, action: #selector(doneButtonTapped)
        )
        return [flexibleSpace, doneButton]
    }
}
