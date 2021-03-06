//
//  MyProfileView.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userVM : UserVM
    @State var id: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var avatar: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        if !avatar.isEmpty {
                            AsyncImage(url: URL(string: avatar)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .failure:
                                    Image(systemName: "person.fill.questionmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 250, alignment: .center)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                }
                            }
                        } else {
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250, alignment: .center)
                        }
                        Spacer()
                    }
                }
                Section {
                    Text("?????????: \(id)")
                    Text("??????: \(name)")
                    Text("?????????: \(email)")
                }
                Section {
                    Button {
                        print("???????????? ?????? ??????")
                    } label: {
                        Text("????????????")
                    }
                }
            }
            .onAppear(perform: {
                print(#fileID, #function, "called")
                userVM.fetchCurrentUserInfo()
            })
            .onReceive(userVM.$loggedInUser, perform: { loggedInUser in
                print(#fileID, #function, "called")
                guard let user = loggedInUser else { return }
                self.id = "\(user.id)"
                self.name = user.name
                self.email = user.email
                self.avatar = user.avatar
            })
        }.navigationTitle("??? ????????? ??????")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
