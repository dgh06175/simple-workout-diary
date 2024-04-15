//
//  CalenderView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI
import SwiftData

struct DiaryCalenderView: View {
    var workoutRecords: [WorkoutRecord]
    let deleteRecordDB: (WorkoutRecord) -> Void

    var body: some View {
        NavigationView {
            VStack {
                //CalendarView(month: Date())
                List {
                    ForEach(workoutRecords) { record in
                        NavigationLink(destination: WorkoutDetailView(
                            workoutRecord: record,
                            deleteRecordDB: deleteRecordDB
                        )) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(record.creationDate.formattedDateYearMonthDay())
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
}
