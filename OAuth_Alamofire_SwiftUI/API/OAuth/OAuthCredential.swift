//
//  OAuthCredential.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/10.
//

import Foundation
import Alamofire

struct OAuthCredential: AuthenticationCredential {
    let accessToken: String
    let refreshToken: String
    let expiration: Date
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 30) > expiration }
}
