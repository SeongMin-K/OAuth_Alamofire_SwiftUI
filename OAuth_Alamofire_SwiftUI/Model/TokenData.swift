//
//  TokenData.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/06.
//

import Foundation

struct TokenData: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken, refreshToken: String
    
    enum Codingkeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
