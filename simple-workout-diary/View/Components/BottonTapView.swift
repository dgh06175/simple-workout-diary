//
//  BottonTapView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct BottonTapView: View {
    @ObservedObject var viewModel: WorkoutVM
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            DiaryCalenderView(viewModel: viewModel)
                .tabItem {
                    Label("캘린더", systemImage: "calendar")
                }
            SettingView(viewModel: viewModel)
                .tabItem {
                    Label("설정", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    BottonTapView(viewModel: WorkoutVM(records: MockWorkoutData.mockWorkoutRecords))
}
