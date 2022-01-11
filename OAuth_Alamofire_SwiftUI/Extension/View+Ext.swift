//
//  View+Ext.swift
//  OAuth_Alamofire_SwiftUI
//
//  Created by SeongMinK on 2022/01/11.
//

import Foundation
import SwiftUI

extension View {
    // 텍스트 필드 커스텀 플레이스 홀더
    func placeholder<PlaceHolderText: View>(shouldShow: Bool,
                                            alignment: Alignment = .leading,
                                            @ViewBuilder placeHolderText: () -> PlaceHolderText) -> some View {
        ZStack(alignment: alignment) {
            placeHolderText().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
