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
    @State var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                CalendarView(
                    month: Date(),
                    workoutRecords: workoutRecords,
                    deleteRecordDB: deleteRecordDB,
                    selectedDate: $selectedDate
                )
                .padding(.bottom)
                SelectedWorkoutListView(
                    workoutRecords: getWorkoutRecords(for: selectedDate),
                    deleteRecordDB: deleteRecordDB,
                    selectedDate: selectedDate
                )
            }
            .navigationTitle("운동 기록")
        }
        
    }
    
    private func getWorkoutRecords(for date: Date) -> [WorkoutRecord] {
        workoutRecords.filter({
            $0.creationDate.startOfDay() == date.startOfDay()
        })
    }
}

struct SelectedWorkoutListView: View {
    var workoutRecords: [WorkoutRecord]
    let deleteRecordDB: (WorkoutRecord) -> Void
    var selectedDate: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(selectedDate.formattedDateDayKR())
                .font(.headline)
                .padding(.horizontal)
            List {
                ForEach(workoutRecords.sorted(by: { $0.creationDate < $1.creationDate })) { record in
                    NavigationLink(destination: WorkoutDetailView(
                        workoutRecord: record,
                        deleteRecordDB: deleteRecordDB
                    )) {
                        WorkoutRecordRow(workoutRecord: record)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct WorkoutRecordRow: View {
    var workoutRecord: WorkoutRecord
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(workoutRecord.memo)
                    .font(.subheadline)
            }
            Spacer()
            Text(workoutRecord.feeling?.rawValue ?? "😐")
                .font(.title2)
                .padding(.trailing)
        }
        .frame(height: 50)
    }
}

#Preview {
    ContentView()
        .modelContainer(sampleData)
}
