//
//  AuthApiService.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/06.
//

import Foundation
import Alamofire
import Combine

// 인증 관련 API 호출
enum AuthApiService {
    static func register(name: String, email: String, password: String) -> AnyPublisher<UserData, AFError> {
        print(#fileID, #function, "called")
        return ApiClient.shared.session
            .request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map { receivedValue in
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
}
