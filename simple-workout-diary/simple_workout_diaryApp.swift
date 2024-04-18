//
//  simple_workout_diaryApp.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI
import SwiftData

@main
struct simple_workout_diaryApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            WorkoutRecord.self
//        ])
//        let modelConfiguration = ModelConfiguration(
//            schema: schema,
//            isStoredInMemoryOnly: false
//        )
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(for: WorkoutRecord.self)
        .modelContainer(sampleData)
//        .modelContainer(sharedModelContainer)
    }
}
