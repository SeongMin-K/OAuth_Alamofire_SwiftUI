//
//  TokenResponse.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/10.
//

import Foundation

struct TokenResponse: Codable {
    let message: String
    let token: TokenData
}
