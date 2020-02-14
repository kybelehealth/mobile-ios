//
//  UILabel+Maker.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

extension UILabel {

    /**
     Creates a Sofia Pro Label with various parameters, all set to the most commonly used values. In applications where UI is created programatically, this method significantly reduce the number of lines written in the corresponding class.

     Parameters:
     - size: Font size
     - strong: Determines which is used: regualar or semi-bold
     - alignment: Alignment of the text in the rect
     - defaultText: The default text
     - lines: Number of lines in the rect.
     - color: Determines the color of the text

     - Returns: A beautiful brand new label

     */
    static func make(ofSize size: CGFloat = 16,
                     strong: Bool = false,
                     alignment: NSTextAlignment = .left,
                     defaultText: String = .empty,
                     lines: Int = 1,
                     color: UIColor = .black,
                     isHidden: Bool = false,
                     adjustWidth: Bool = false,
                     lineSpacing: CGFloat = 0,
                     lineHeightMultiple: CGFloat = 1) -> UILabel {
        let label = UILabel()
        label.numberOfLines = lines
        label.textAlignment = alignment
        label.textColor = color
        label.text = defaultText
        label.isHidden = isHidden
        label.adjustsFontSizeToFitWidth = adjustWidth
        label.font = strong ? UIFont.boldSystemFont(ofSize: size) : UIFont.systemFont(ofSize: size)
        label.setLineSpacing(lineSpacing: lineSpacing, lineHeightMultiple: lineHeightMultiple)
        return label
    }
}

extension UILabel {

    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = self.textAlignment

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
}
