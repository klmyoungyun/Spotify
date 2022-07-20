//
//  Font+Extension.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/20.
//

import UIKit

public enum FontType: String {
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
    case semiBold = "SemiBold"
}
extension UIFont {
    static func NotoSans(_ type: FontType, size: CGFloat) -> UIFont {
        switch type {
        case .semiBold:
            return UIFont(name: "NotoSans-SemiBold", size: size)!
        case .bold:
            return UIFont(name: "NotoSansKR-Bold", size: size)!
        case .medium:
            return UIFont(name: "NotoSansKR-Medium", size: size)!
        default:
            return UIFont(name: "NotoSansKR-Regular", size: size)!
        }
    }
}
