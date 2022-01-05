//
//  RegisterView.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("이름"), content: {
                    TextField("이름", text: $name)
                })
                Section(header: Text("이메일"), content: {
                    TextField("이메일", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                })
                Section(header: Text("비밀번호"), content: {
                    SecureField("비밀번호", text: $password)
                    SecureField("비밀번호 확인", text: $password)
                })
                Section {
                    Button(action: {
                        print("회원가입 버튼 클릭됨")
                    }, label: {
                        Text("회원가입 하기")
                    })
                }
            }
        }.navigationTitle("회원가입 화면")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
