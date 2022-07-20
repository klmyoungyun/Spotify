//
//  UIColor+Extension.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/20.
//

import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
}
extension UIColor {
    open class var spotifyGreen:UIColor? { UIColor(named: "spotify_green") }
}
