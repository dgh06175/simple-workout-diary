//
//  SampleData.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/12/24.
//

import SwiftData
import SwiftUI

@MainActor
let sampleData: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: WorkoutRecord.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<WorkoutRecord>()).isEmpty {
            MockWorkoutData.contents.forEach { container.mainContext.insert($0) }
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()


struct MockWorkoutData {
    static let contents: [WorkoutRecord] = [
        WorkoutRecord(creationDate: Date(), memo: "아침에 달리기 좋았음", feeling: .motivated), // 1일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-252200), memo: "오늘은 좀 피곤했음", feeling: .tired), // 3일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-482000), memo: "괜찮은 운동이었음", feeling: .soso), // 5일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-614800), memo: "지금까지 최고의 세션!", feeling: .motivated), // 7일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-834000), memo: "끝까지 하기 힘들었음", feeling: .tired), // 10일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-1396000), memo: "평범한 하루", feeling: .soso), // 15일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-1792730), memo: "개인 기록 경신", feeling: .motivated), // 20일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-2283400), memo: "오늘은 별로였음", feeling: .tired), // 25일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-2123430), memo: "일정한 속도 유지", feeling: .soso), // 30일 전
        WorkoutRecord(creationDate: Date().addingTimeInterval(-3323230), memo: "멈출 수 없었음", feeling: .motivated) // 4일 전
    ]
}
