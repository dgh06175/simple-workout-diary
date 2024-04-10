//
//  Workout.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import Foundation
import SwiftData

@Model
class WorkoutDetailRecord: Identifiable {
    let id = UUID()
    let creationDate: Date
    var workoutDetails: [WorkoutDetail]
    var memo: String
    var feeling: WorkoutFeeling?
    
    init(creationDate: Date = .now, workoutDetails: [WorkoutDetail], memo: String = "", feeling: WorkoutFeeling) {
        self.creationDate = creationDate
        self.workoutDetails = workoutDetails
        self.memo = memo
        self.feeling = feeling
    }
}

struct WorkoutDetail: Identifiable {
    let id = UUID()
    let workout: Workout
    var workoutSets: [WorkoutSet]
    
    init(workout: Workout, workoutSets: [WorkoutSet] = []) {
        self.workout = workout
        self.workoutSets = workoutSets
    }
}

struct WorkoutSet: Identifiable {
    let id = UUID()
    let weight: Double
    var repetitions: Int
    
    init(weight: Double, repetitions: Int = 0) {
        self.weight = max(weight, 0)
        self.repetitions = max(repetitions, 0)
    }
    
    mutating func addRepetitions() {
        self.repetitions += 1
    }
    
    mutating func subRepetitions() {
        if repetitions >= 1 {
            repetitions -= 1
        }
    }
}

struct Workout {
    let name: String
    // let muscleGroups: [MuscleGroup]
    // let imageUrl: String
}

enum WorkoutFeeling: String {
    case tired = "😨"
    case soso = "😐"
    case motivated = "🔥"
}
