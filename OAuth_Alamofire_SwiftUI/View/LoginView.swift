//
//  LoginView.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userVM: UserVM
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var shouldShowAlert: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("로그인 정보"), content: {
                    TextField("이메일", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("비밀번호", text: $password)
                })
                Section {
                    Button(action: {
                        print("로그인 버튼 클릭됨")
                    }, label: {
                        Text("로그인 하기")
                    })
                }
            }
            .onReceive(userVM.loginSuccess, perform: {
                print(#fileID, #function, "called")
                self.shouldShowAlert = true
            })
            .alert("로그인이 완료되었습니다.", isPresented: $shouldShowAlert) {
                Button("확인", role: .cancel) {
                    self.dismiss()
                }
            }
        }.navigationTitle("로그인 화면")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
