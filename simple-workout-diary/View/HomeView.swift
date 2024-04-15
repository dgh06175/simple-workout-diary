//
//  HomeView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct HomeView: View {
    var workoutRecords: [WorkoutRecord]
    let insertRecordDB: (WorkoutRecord) -> Void
    
    @State private var isDiaryAddViewPresented = false

    
    var body: some View {
        VStack {
            FireEffect()
                .frame(width: 200, height: 230)
            DiaryAddButtonView(isDiaryAddViewPresented: $isDiaryAddViewPresented)
                .fullScreenCover(isPresented: $isDiaryAddViewPresented) {
                    WorkoutDiaryAddView(
                        insertRecordDB: insertRecordDB
                    )
                }
        }
    }
}

struct DiaryAddButtonView: View {
    @Binding var isDiaryAddViewPresented: Bool
    
    var body: some View {
        Button(action: toggleDiaryAddView) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.customDarkRed)
                    .frame(width: 220, height: 70)
                Text("오늘의 운동 기록하기")
                    .font(.title3)
                    .foregroundStyle(Color.white)
            }
            .padding()
        }
    }
    
    private func toggleDiaryAddView() {
        isDiaryAddViewPresented = true
    }
}
