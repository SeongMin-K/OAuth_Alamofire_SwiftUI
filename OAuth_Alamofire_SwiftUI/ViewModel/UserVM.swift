//
//  UserVM.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/06.
//

import Foundation
import Alamofire
import Combine

class UserVM: ObservableObject {
    //MARK: properties
    @Published var loggedInUser: UserData? = nil
    @Published var users: [UserData] = []
    var subscription = Set<AnyCancellable>()
    var registrationSuccess = PassthroughSubject<(), Never>()
    var loginSuccess = PassthroughSubject<(), Never>()
    
    // 회원가입
    func register(name: String, email: String, password: String) {
        print(#fileID, #function, "called")
        
        AuthApiService.register(name: name, email: email, password: password)
            .sink { completion in
                print("UserVM completion:", completion)
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.registrationSuccess.send()
            }.store(in: &subscription)
    }

    // 로그인
    func login(email: String, password: String) {
        print(#fileID, #function, "called")
        
        AuthApiService.login(email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription)
    }
    
    // 내 프로필
    func fetchCurrentUserInfo() {
        print("UserVM - fetchCurrentUserInfo() called")
        UserApiService.fetchCurrentUserInfo()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM fetchCurrentUserInfo completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                print("UserVM fetchCurrentUserInfo receivedUser: \(receivedUser)")
                self.loggedInUser = receivedUser
            }.store(in: &subscription)
    }
    
    // 사용자 목록
    func fetchUsers() {
        print("UserVM - fetchUsers() called")
        UserApiService.fetchUsers()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM fetchUsers completion: \(completion)")
            } receiveValue: { (fetchedUsers: [UserData]) in
                print("UserVM fetchUsers fetchedUsers.count: \(fetchedUsers.count)")
                self.users = fetchedUsers
            }.store(in: &subscription)
    }
}
