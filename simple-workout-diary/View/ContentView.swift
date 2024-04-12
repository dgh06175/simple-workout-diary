//
//  BottonTapView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            DiaryCalenderView()
                .tabItem {
                    Label("캘린더", systemImage: "calendar")
                }
            SettingView()
                .tabItem {
                    Label("설정", systemImage: "gearshape")
                }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(sampleData)
}
