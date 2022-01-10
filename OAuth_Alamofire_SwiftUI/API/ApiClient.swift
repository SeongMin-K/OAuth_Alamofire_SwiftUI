//
//  ApiClient.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/06.
//

import Foundation
import Alamofire

// API 호출 클라이언트
final class ApiClient {
    static let shared = ApiClient()
    static let BASE_URL = "https://dev-jeongdaeri-oauth.tk/api"
    let monitors = [ApiLogger()] as [EventMonitor]
    var session: Session
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor()   // application/json
    ])
    
    init() {
        print("ApiClient - init() called")
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}
