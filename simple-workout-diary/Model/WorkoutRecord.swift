//
//  Workout.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import Foundation
import SwiftData

@Model
final class WorkoutRecord {
    let id = UUID()
    var creationDate: Date
    var memo: String
    var feeling: WorkoutFeeling?
    
    init(creationDate: Date = .now, memo: String = "", feeling: WorkoutFeeling? = nil) {
        self.creationDate = creationDate
        self.memo = memo
        self.feeling = feeling
    }
}

enum WorkoutFeeling: String, CaseIterable, Codable {
    case tired = "😨"
    case soso = "😐"
    case motivated = "🔥"
}

//@Model
//final class WorkoutRecord: Identifiable, ObservableObject {
//    let id = UUID()
//    let creationDate: Date
//    @Published var workoutDetails: [WorkoutDetail]
//    @Published var memo: String
//    @Published var feeling: WorkoutFeeling?
//    
//    init(creationDate: Date = .now, workoutDetails: [WorkoutDetail], memo: String = "", feeling: WorkoutFeeling) {
//        self.creationDate = creationDate
//        self.workoutDetails = workoutDetails
//        self.memo = memo
//        self.feeling = feeling
//    }
//}
//
//struct WorkoutDetail: Identifiable {
//    let id = UUID()
//    let workout: WorkoutType
//    var workoutSets: [WorkoutSet]
//    
//    init(workout: WorkoutType, workoutSets: [WorkoutSet] = []) {
//        self.workout = workout
//        self.workoutSets = workoutSets
//    }
//}
//
//struct WorkoutSet: Identifiable {
//    let id = UUID()
//    let weight: Double
//    var repetitions: Int
//    
//    init(weight: Double, repetitions: Int = 0) {
//        self.weight = max(weight, 0)
//        self.repetitions = max(repetitions, 0)
//    }
//    
//    mutating func addRepetitions() {
//        self.repetitions += 1
//    }
//    
//    mutating func subRepetitions() {
//        if repetitions >= 1 {
//            repetitions -= 1
//        }
//    }
//}
//
//protocol WorkoutType {
//    var name: String { get }
//    var muscleGroups: [MuscleGroup] { get }
//    var imageUrl: String { get }
//}
//
//enum MuscleGroup: String {
//    case chest = "가슴"
//    case back = "등"
//    case shoulder = "어깨"
//    case arm = "팔"
//    case core = "코어"
//    case frontLeg = "대퇴근"
//    case backLeg = "햄스트링"
//}
//

