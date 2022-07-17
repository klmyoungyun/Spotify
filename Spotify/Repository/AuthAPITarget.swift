//
//  AuthTarget.swift
//  Spotify
//
//  Created by 김영균 on 2022/07/17.
//

import Foundation
import Moya

struct Constants {
        static let clientID = "d553ba8406504f2bb450c37d48c29ff5"
        static let clientSecret = "baf4720012a647d5a09fdeaee9937504"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let redirectURI = "https://github.com/klmyoungyun"
        static let scope = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-follow-read%20user-library-modify%20user-library-read%20user-read-email"
    }

enum AuthAPITarget {
    case accessToken(code: String)
}
extension AuthAPITarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://accounts.spotify.com/api/token")!
    }
    
    var path: String {
        switch self {
        case .accessToken:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .accessToken:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .accessToken(let code):
            return .requestParameters(parameters: ["grant_type": "authorization_code" ,
                                                   "code": code,
                                                   "redirect_uri": Constants.redirectURI],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .accessToken:
            return ["Content-Type": "application/json" ,
                    "Authorization" : Constants.clientID + ":" + Constants.clientSecret]
        }
    }
    
    
}
