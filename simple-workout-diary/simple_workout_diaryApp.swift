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
    @ObservedObject var viewModel: WorkoutVM = WorkoutVM(records: MockWorkoutData.mockWorkoutRecords)

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            BottonTapView(viewModel: viewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
