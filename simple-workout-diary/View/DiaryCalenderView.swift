//
//  CalenderView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct DiaryCalenderView: View {
    @ObservedObject var viewModel: WorkoutVM
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.records.sorted(by: {$0.creationDate > $1.creationDate })) { record in
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
            let recordID = viewModel.records[index].id
            viewModel.deleteRecord(withID: recordID)
        }
    }
}

#Preview {
    DiaryCalenderView(viewModel: WorkoutVM(records: MockWorkoutData.mockWorkoutRecords))
}
