//
//  CustomViewModifier.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/11/24.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .padding()
            .textInputAutocapitalization(.never) // 처음 문자 자동으로 대문자로 바꿔주는 기능 막기
            .frame(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .foregroundColor(Color(UIColor.systemGray3))
                    .frame(width: width, height: height)
            }
    }
}
