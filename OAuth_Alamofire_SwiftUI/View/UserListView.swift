//
//  UserListView.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct UserListView: View {
    @State var users: [UserData] = []
    
    var body: some View {
        List(users) { aUser in
            NavigationLink(destination: OtherUserProfileView(userData: aUser), label: {
                HStack {
                    AsyncImage(url: URL(string: aUser.avatar)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 120, height: 120, alignment: .center)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120, alignment: .center)
                        case .failure:
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120, alignment: .center)
                        @unknown default:
                            EmptyView()
                                .frame(width: 120, height: 120, alignment: .center)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(aUser.name)
                            .font(.title3)
                        Text(aUser.email)
                            .font(.callout)
                    }
                }
            })
        }.navigationTitle("사용자 목록 화면")
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
