//
//  OAuthAuthenticator.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/10.
//

import Foundation
import Alamofire

class OAuthAuthenticator: Authenticator {
    func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
            // 헤더에 Authrization 키로 Bearer 토큰값
            urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
        }
    
    func refresh(_ credential: OAuthCredential, for session: Session,
                 completion: @escaping (Result<OAuthCredential, Error>) -> Void) {
        print(#fileID, #function, "called")
        
        let request = session.request(AuthRouter.tokenRefresh)
        request.responseDecodable(of: TokenResponse.self) { result in
            switch result.result {
            case .success(let value):
                // 재발행 받은 토큰 저장
                UserDefaultsManager.shared.setTokens(accessToken: value.token.accessToken, refreshToken: value.token.refreshToken)
                let expiration = Date(timeIntervalSinceNow: 60 * 60)
                // 새로운 크리덴셜
                let newCredential = OAuthCredential(accessToken: value.token.accessToken, refreshToken: value.token.refreshToken, expiration: expiration)
                completion(.success(newCredential))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // api 요청 완료
    func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse,
                    failDueToAuthenticationError error: Error) -> Bool {
        print(#fileID, #function, "called")
        
        // 401 코드가 떨어지면 리프레시 토큰으로 액세스 토큰을 재발행 하라고 요청
        switch response.statusCode {
            case 401: return true
            default: return false
        }
    }

    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        return true
    }
}
