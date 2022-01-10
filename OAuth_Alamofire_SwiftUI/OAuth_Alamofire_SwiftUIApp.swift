//
//  OAuth_Alamofire_SwiftUIApp.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/05.
//

import SwiftUI

@main
struct OAuth_Alamofire_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserVM())
        }
    }
}
