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
                .animation(.linear(duration: 0.1) ,value: selectedDate)
            }
            .navigationTitle("운동 기록")
        }
    }
    
    private func getWorkoutRecords(for date: Date) -> [WorkoutRecord] {
        workoutRecords.filter { workoutRecord in
            date.isSameDate(date: workoutRecord.creationDate)
        }
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
            Text(workoutRecord.memo)
                .font(.subheadline)
            Spacer()
            Text("총 \(totalWeight(for: workoutRecord))kg")
                .font(.footnote)
            Text(workoutRecord.feeling?.rawValue ?? "😐")
                .font(.title2)
                .padding(.trailing)
        }
        .frame(height: 50)
    }
    
    func totalWeight(for workoutRecord: WorkoutRecord) -> Int {
        let total = workoutRecord.workoutDetails.reduce(0) { sum, detail in
            sum + detail.weight
        }
        return total
    }
}

#Preview {
    ContentView()
        .modelContainer(sampleData)
}
