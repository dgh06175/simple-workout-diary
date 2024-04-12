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
    @Query private var workoutRecords: [WorkoutRecord]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(workoutRecords) { record in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(record.creationDate, style: .date)
                                .font(.headline)
                            Text(record.memo)
                                .font(.subheadline)
                            Text(record.feeling?.rawValue ?? "😐")
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar { EditButton() }
            .navigationTitle("운동 기록")
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(workoutRecords[index])
        }
    }
}
