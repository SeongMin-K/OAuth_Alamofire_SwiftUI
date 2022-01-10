//
//  UserData.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import Foundation

struct UserData: Codable, Identifiable {
    var uuid: UUID = UUID()
    var id: Int
    var name: String
    var email: String
    var avatar: String
    
    enum Codingkeys: String, CodingKey {
        case id
        case name
        case email
        case avatar
    }
}
