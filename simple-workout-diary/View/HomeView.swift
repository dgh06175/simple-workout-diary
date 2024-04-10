//
//  HomeView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingDiaryAddView = false
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .font(.system(size: 150))
                .frame(height: 400)
            Button(action: {
                isShowingDiaryAddView = true
            }) {
                DiaryAddButtonView()
            }
            .fullScreenCover(isPresented: $isShowingDiaryAddView) {
                DiaryAddView()
            }
        }
    }
}

struct DiaryAddButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.color1)
                .frame(width: 220, height: 70)
            Text("오늘의 운동 기록하기")
                .font(.title3)
                .foregroundStyle(Color.white)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
