//
//  MyNavigationLink.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

struct MyNavigationLink: View {
    var name: String
    var color: Color
    
    var body: some View {
        HStack {
            Spacer()
            Text(name)
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
