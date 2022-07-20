//
//  NSAttributedString+Extension.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/20.
//

import UIKit

extension NSAttributedString {
    static func attributedString(type: FontType, text: String, size: CGFloat, color: UIColor?) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attrString = NSAttributedString(
            string: text,
            attributes: [.font: UIFont.NotoSans(type, size: size) as Any,
                         .paragraphStyle: paragraphStyle,
                         .foregroundColor: color as Any])
        return attrString
    }
}
