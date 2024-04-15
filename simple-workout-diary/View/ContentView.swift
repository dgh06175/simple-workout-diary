//
//  BottonTapView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var workoutRecords: [WorkoutRecord]

    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView {
            HomeView(
                workoutRecords: workoutRecords,
                insertRecordDB: insertRecordDB
            )
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            DiaryCalenderView(
                workoutRecords: workoutRecords,
                deleteRecordDB: deleteRecordDB
            )
                .tabItem {
                    Label("캘린더", systemImage: "calendar")
                }
            SettingView()
                .tabItem {
                    Label("설정", systemImage: "gearshape")
                }
        }
    }
    
    private func insertRecordDB(record: WorkoutRecord) {
        modelContext.insert(record)
    }
    
    private func deleteRecordDB(record: WorkoutRecord) {
        modelContext.delete(record)
    }
}


#Preview {
    ContentView()
        .modelContainer(sampleData)
}
