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
        // 첫 번째 주
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-70 * 24 * 3600), // 70일 전
            memo: "첫 훈련, 의욕 충만!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 50),
                WorkoutDetail(workoutType: .squat, weight: 80),
                WorkoutDetail(workoutType: .deadlift, weight: 100),
                WorkoutDetail(workoutType: .overHeadPress, weight: 30),
                WorkoutDetail(workoutType: .barbellRow, weight: 50)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-68 * 24 * 3600), // 68일 전
            memo: "오늘은 조금 힘들었어요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 50),
                WorkoutDetail(workoutType: .squat, weight: 85),
                WorkoutDetail(workoutType: .deadlift, weight: 105),
                WorkoutDetail(workoutType: .overHeadPress, weight: 30),
                WorkoutDetail(workoutType: .barbellRow, weight: 55)
            ],
            feeling: .soso
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-65 * 24 * 3600), // 65일 전
            memo: "오늘 기분 최고!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 55),
                WorkoutDetail(workoutType: .squat, weight: 90),
                WorkoutDetail(workoutType: .deadlift, weight: 110),
                WorkoutDetail(workoutType: .overHeadPress, weight: 35),
                WorkoutDetail(workoutType: .barbellRow, weight: 55)
            ],
            feeling: .motivated
        ),
        // 두 번째 주
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-62 * 24 * 3600), // 62일 전
            memo: "지난번보다 좋아졌어요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 55),
                WorkoutDetail(workoutType: .squat, weight: 90),
                WorkoutDetail(workoutType: .deadlift, weight: 115),
                WorkoutDetail(workoutType: .overHeadPress, weight: 35),
                WorkoutDetail(workoutType: .barbellRow, weight: 55)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-59 * 24 * 3600), // 59일 전
            memo: "점점 나아지고 있어요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 55),
                WorkoutDetail(workoutType: .squat, weight: 95),
                WorkoutDetail(workoutType: .deadlift, weight: 120),
                WorkoutDetail(workoutType: .overHeadPress, weight: 35),
                WorkoutDetail(workoutType: .barbellRow, weight: 60)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-56 * 24 * 3600), // 56일 전
            memo: "오늘은 좀 힘들었어요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 60),
                WorkoutDetail(workoutType: .squat, weight: 95),
                WorkoutDetail(workoutType: .deadlift, weight: 120),
                WorkoutDetail(workoutType: .overHeadPress, weight: 35),
                WorkoutDetail(workoutType: .barbellRow, weight: 60)
            ],
            feeling: .soso
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-53 * 24 * 3600), // 53일 전
            memo: "좋은 기분으로 시작!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 65),
                WorkoutDetail(workoutType: .squat, weight: 100),
                WorkoutDetail(workoutType: .deadlift, weight: 125),
                WorkoutDetail(workoutType: .overHeadPress, weight: 35),
                WorkoutDetail(workoutType: .barbellRow, weight: 65)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-50 * 24 * 3600), // 50일 전
            memo: "오늘도 열심히!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 65),
                WorkoutDetail(workoutType: .squat, weight: 100),
                WorkoutDetail(workoutType: .deadlift, weight: 125),
                WorkoutDetail(workoutType: .overHeadPress, weight: 35),
                WorkoutDetail(workoutType: .barbellRow, weight: 65)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-47 * 24 * 3600), // 47일 전
            memo: "조금 힘들어도 계속!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 65),
                WorkoutDetail(workoutType: .squat, weight: 105),
                WorkoutDetail(workoutType: .deadlift, weight: 130),
                WorkoutDetail(workoutType: .overHeadPress, weight: 40),
                WorkoutDetail(workoutType: .barbellRow, weight: 70)
            ],
            feeling: .soso
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-44 * 24 * 3600), // 44일 전
            memo: "기운이 넘치는 날!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 70),
                WorkoutDetail(workoutType: .squat, weight: 105),
                WorkoutDetail(workoutType: .deadlift, weight: 130),
                WorkoutDetail(workoutType: .overHeadPress, weight: 40),
                WorkoutDetail(workoutType: .barbellRow, weight: 70)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-41 * 24 * 3600), // 41일 전
            memo: "오늘은 조금 덜 힘들었어요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 70),
                WorkoutDetail(workoutType: .squat, weight: 110),
                WorkoutDetail(workoutType: .deadlift, weight: 130),
                WorkoutDetail(workoutType: .overHeadPress, weight: 40),
                WorkoutDetail(workoutType: .barbellRow, weight: 70)
            ],
            feeling: .soso
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-38 * 24 * 3600), // 38일 전
            memo: "약간 지친 하루",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 70),
                WorkoutDetail(workoutType: .squat, weight: 110),
                WorkoutDetail(workoutType: .deadlift, weight: 135),
                WorkoutDetail(workoutType: .overHeadPress, weight: 40),
                WorkoutDetail(workoutType: .barbellRow, weight: 70)
            ],
            feeling: .tired
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-35 * 24 * 3600), // 35일 전
            memo: "다시 힘을 내서!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 70),
                WorkoutDetail(workoutType: .squat, weight: 110),
                WorkoutDetail(workoutType: .deadlift, weight: 135),
                WorkoutDetail(workoutType: .overHeadPress, weight: 40),
                WorkoutDetail(workoutType: .barbellRow, weight: 75)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-32 * 24 * 3600), // 32일 전
            memo: "끊임없는 도전",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 75),
                WorkoutDetail(workoutType: .squat, weight: 115),
                WorkoutDetail(workoutType: .deadlift, weight: 135),
                WorkoutDetail(workoutType: .overHeadPress, weight: 40),
                WorkoutDetail(workoutType: .barbellRow, weight: 75)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-29 * 24 * 3600), // 29일 전
            memo: "최고의 컨디션!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 75),
                WorkoutDetail(workoutType: .squat, weight: 115),
                WorkoutDetail(workoutType: .deadlift, weight: 135),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 75)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-26 * 24 * 3600), // 26일 전
            memo: "어느 정도 피곤함이 느껴져요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 75),
                WorkoutDetail(workoutType: .squat, weight: 115),
                WorkoutDetail(workoutType: .deadlift, weight: 140),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 80)
            ],
            feeling: .tired
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-23 * 24 * 3600), // 23일 전
            memo: "오늘은 조금 더 노력해야 할 것 같아요",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 75),
                WorkoutDetail(workoutType: .squat, weight: 115),
                WorkoutDetail(workoutType: .deadlift, weight: 140),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 80)
            ],
            feeling: .soso
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-20 * 24 * 3600), // 20일 전
            memo: "오늘은 좋은 날이에요!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 75),
                WorkoutDetail(workoutType: .squat, weight: 120),
                WorkoutDetail(workoutType: .deadlift, weight: 145),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 80)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-17 * 24 * 3600), // 17일 전
            memo: "피곤함이 느껴집니다",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 75),
                WorkoutDetail(workoutType: .squat, weight: 120),
                WorkoutDetail(workoutType: .deadlift, weight: 145),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 80)
            ],
            feeling: .tired
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-14 * 24 * 3600), // 14일 전
            memo: "점점 힘이 나네요!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 80),
                WorkoutDetail(workoutType: .squat, weight: 120),
                WorkoutDetail(workoutType: .deadlift, weight: 145),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 85)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-11 * 24 * 3600), // 11일 전
            memo: "조금 무리하지 않게",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 80),
                WorkoutDetail(workoutType: .squat, weight: 125),
                WorkoutDetail(workoutType: .deadlift, weight: 145),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 85)
            ],
            feeling: .soso
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-8 * 24 * 3600), // 8일 전
            memo: "최고의 컨디션!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 80),
                WorkoutDetail(workoutType: .squat, weight: 125),
                WorkoutDetail(workoutType: .deadlift, weight: 145),
                WorkoutDetail(workoutType: .overHeadPress, weight: 45),
                WorkoutDetail(workoutType: .barbellRow, weight: 85)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-5 * 24 * 3600), // 5일 전
            memo: "오늘도 최선을 다해서",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 80),
                WorkoutDetail(workoutType: .squat, weight: 125),
                WorkoutDetail(workoutType: .deadlift, weight: 150),
                WorkoutDetail(workoutType: .overHeadPress, weight: 50),
                WorkoutDetail(workoutType: .barbellRow, weight: 85)
            ],
            feeling: .motivated
        ),
        WorkoutRecord(
            creationDate: Date().addingTimeInterval(-2 * 24 * 3600), // 2일 전
            memo: "마지막 훈련, 훌륭했어요!",
            workoutDetails: [
                WorkoutDetail(workoutType: .benchPress, weight: 80),
                WorkoutDetail(workoutType: .squat, weight: 125),
                WorkoutDetail(workoutType: .deadlift, weight: 150),
                WorkoutDetail(workoutType: .overHeadPress, weight: 50),
                WorkoutDetail(workoutType: .barbellRow, weight: 85)
            ],
            feeling: .motivated
        )

    ]
}

//struct MockWorkoutData {
//    static let contents: [WorkoutRecord] = [
//        WorkoutRecord(
//            creationDate: Date(),
//            memo: "두번째 운동은 힘드네",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .benchPress, weight: 100),
//                WorkoutDetail(workoutType: .squat, weight: 140)
//            ],
//            feeling: .soso
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-1233),
//            memo: "아침에 달리기 좋았음",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .deadlift, weight: 180),
//                WorkoutDetail(workoutType: .overHeadPress, weight: 50)
//            ],
//            feeling: .motivated
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-252200),
//            memo: "오늘은 좀 피곤했음",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .barbellRow, weight: 120)
//            ],
//            feeling: .tired
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-482000),
//            memo: "괜찮은 운동이었음",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .squat, weight: 130),
//                WorkoutDetail(workoutType: .benchPress, weight: 110)
//            ],
//            feeling: .soso
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-614800),
//            memo: "지금까지 최고의 세션!",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .overHeadPress, weight: 60),
//                WorkoutDetail(workoutType: .deadlift, weight: 200)
//            ],
//            feeling: .motivated
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-834000),
//            memo: "끝까지 하기 힘들었음",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .barbellRow, weight: 130)
//            ],
//            feeling: .tired
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-1396000),
//            memo: "평범한 하루",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .benchPress, weight: 95)
//            ],
//            feeling: .soso
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-1792730),
//            memo: "개인 기록 경신",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .squat, weight: 150)
//            ],
//            feeling: .motivated
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-2283400),
//            memo: "오늘은 별로였음",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .deadlift, weight: 160)
//            ],
//            feeling: .tired
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-2123430),
//            memo: "일정한 속도 유지",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .overHeadPress, weight: 55)
//            ],
//            feeling: .soso
//        ),
//        WorkoutRecord(
//            creationDate: Date().addingTimeInterval(-3323230),
//            memo: "멈출 수 없었음",
//            workoutDetails: [
//                WorkoutDetail(workoutType: .barbellRow, weight: 125),
//                WorkoutDetail(workoutType: .benchPress, weight: 115)
//            ],
//            feeling: .motivated
//        )
//    ]
//}
//
