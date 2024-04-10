//
//  DiaryAddView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import SwiftUI

struct DiaryAddView: View {
    @Environment(\.dismiss) var dismiss

        var body: some View {
            VStack {
                Button("닫기") {
                    dismiss()
                }
                Image(systemName: "pencil.tip.crop.circle.badge.plus")
                    .font(.system(size: 150))
            }
        }
}

#Preview {
    DiaryAddView()
}
