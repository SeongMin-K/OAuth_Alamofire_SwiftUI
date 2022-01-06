//
//  AuthResponse.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/06.
//

import Foundation

struct AuthResponse: Codable {
    var user: UserData
    var token: TokenData
    
    enum Codingkeys: String, CodingKey {
        case user
        case token
    }
}
