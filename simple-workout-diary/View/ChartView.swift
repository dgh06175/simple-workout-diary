//
//  SettingView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    var workoutRecords: [WorkoutRecord]
    @State private var selectedWorkoutType: WorkoutType = .benchPress
    
    // 날짜와 무게로 구조화
    var dataPoints: [(date: Date, weight: Int)] {
        workoutRecords.flatMap { record in
            record.workoutDetails
                .filter { $0.workoutType == selectedWorkoutType && $0.weight > 0 }
                .map { (date: record.creationDate, weight: $0.weight) }
        }
        .sorted(by: { $0.date < $1.date })
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("무게 변화 그래프")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
                .frame(height: 16)
            HStack {
                Text(selectedWorkoutType.rawValue)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            HStack {
                Image(selectedWorkoutType.imageName)
                    .resizable().scaledToFit().frame(height: 100)
            }
            Spacer()
                .frame(height: 16)
            if !dataPoints.isEmpty {
                Chart {
                    ForEach(dataPoints, id: \.date) { item in
                        LineMark (
                            x: .value("날짜", item.date),
                            y: .value("무게 (kg)", item.weight)
                        )
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                    }
                }
                .padding()
            } else {
                Text("선택한 운동의 기록이 없습니다.")
                    .padding()
            }
            Spacer()
            Picker("운동 선택", selection: $selectedWorkoutType) {
                ForEach(WorkoutType.allCases, id: \.self) { workoutType in
                    Text(workoutType.rawValue).tag(workoutType)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}
