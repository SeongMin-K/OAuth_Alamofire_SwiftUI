//
//  RegisterView.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userVM: UserVM
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State fileprivate var shouldShowAlert = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("이름"), content: {
                    TextField("이름", text: $name)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                })
                Section(header: Text("이메일"), content: {
                    TextField("이메일", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                })
                Section(header: Text("비밀번호"), content: {
                    SecureField("비밀번호", text: $password)
                    SecureField("비밀번호 확인", text: $password)
                })
                Section {
                    Button(action: {
                        print("회원가입 버튼 클릭됨")
                        userVM.register(name: name, email: email, password: password)
                    }, label: {
                        Text("회원가입 하기")
                    })
                }
            }
            .onReceive(userVM.registrationSuccess, perform: {
                print(#fileID, #function, "called")
                self.shouldShowAlert = true
            })
            .alert("회원가입이 완료되었습니다.", isPresented: $shouldShowAlert) {
                Button("확인", role: .cancel) {
                    self.dismiss()
                }
            }
        }.navigationTitle("회원가입 화면")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(UserVM())
    }
}
