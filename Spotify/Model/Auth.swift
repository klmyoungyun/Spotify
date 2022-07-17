//
//  Auth.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/17.
//

import Foundation

struct Auth: Codable {
    let accessToken: String
    let tokenType: String
    let scope: String
    let expiresIn: Int
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope = "scope"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
    }
}
