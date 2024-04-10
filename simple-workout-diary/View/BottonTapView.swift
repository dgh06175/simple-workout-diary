//
//  BottonTapView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct BottonTapView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            CalenderView()
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
    BottonTapView()
}
