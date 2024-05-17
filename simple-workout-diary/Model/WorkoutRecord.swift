//
//  Workout.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import SwiftUI
import SwiftData

@Model
final class WorkoutRecord {
    var creationDate: Date
    var memo: String
    var workoutDetails: [WorkoutDetail]
    var feeling: WorkoutFeeling?
    
    init(creationDate: Date = .now, memo: String = "", workoutDetails: [WorkoutDetail], feeling: WorkoutFeeling? = nil) {
        self.creationDate = creationDate
        self.memo = memo
        self.workoutDetails = workoutDetails
        self.feeling = feeling
    }
}

@Model
final class WorkoutDetail {
    let workoutType: WorkoutType
    var weight: Int
    
    init(workoutType: WorkoutType, weight: Int = 0) {
        self.workoutType = workoutType
        self.weight = weight
    }
}

enum WorkoutType: String, CaseIterable, Codable {
    case benchPress = "벤치프레스"
    case deadlift = "데드 리프트"
    case squat = "스쿼트"
    case overHeadPress = "오버헤드 프레스"
    case barbellRow = "바벨로우"
    
    var imageName: String {
        switch self {
        case .benchPress:
            return "bench-press"  // 여기에 실제 이미지 파일 이름 입력
        case .deadlift:
            return "deadlift"
        case .squat:
            return "squat"
        case .overHeadPress:
            return "over-head-press"
        case .barbellRow:
            return "barbell-row"
        }
    }
}

enum WorkoutFeeling: String, CaseIterable, Codable {
    case tired = "😨"
    case soso = "😐"
    case motivated = "🔥"
}

#Preview {
    VStack {
        ForEach(WorkoutType.allCases, id: \.self) { type in
            Image(type.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
        }
    }
}
