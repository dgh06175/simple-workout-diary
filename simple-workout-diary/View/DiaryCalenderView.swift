//
//  CalenderView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI
import SwiftData

struct DiaryCalenderView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WorkoutRecord.creationDate, order: .reverse) private var workoutRecords: [WorkoutRecord]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(workoutRecords) { record in
                    NavigationLink(destination: WorkoutDetailView(workoutRecord: record)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(DateUtil.formattedCurrentDate(record.creationDate))
                                    .font(.headline)
                                Text(record.memo)
                                    .font(.subheadline)
                                Text(record.feeling?.rawValue ?? "😐")
                                    .font(.caption)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("운동 기록")
        }
    }
}