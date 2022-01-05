//
//  ContentView.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 160))
                Spacer().frame(height: 60)
                NavigationLink(destination: LoginView(), label: {
                    MyNavigationLink(name: "로그인", color: .blue)
                })
                NavigationLink(destination: RegisterView(), label: {
                    MyNavigationLink(name: "회원가입", color: .black)
                })
                Spacer().frame(height: 40)
                NavigationLink(destination: ProfileView(), label: {
                    MyNavigationLink(name: "프로필", color: .purple)
                })
                NavigationLink(destination: UserListView(), label: {
                    MyNavigationLink(name: "사용자 목록", color: .green)
                })
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
