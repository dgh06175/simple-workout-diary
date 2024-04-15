//
//  WorkoutDetailView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/12/24.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    var workoutRecord: WorkoutRecord
    let deleteRecordDB: (WorkoutRecord) -> Void
    
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text(workoutRecord.memo)
                .font(.body)
            Text(getFeeling())
                .font(.caption)
            Spacer()
        }
        .navigationTitle(workoutRecord.creationDate.formattedDateYearMonthDay())
        .alert("정말 삭제하시겠습니까?", isPresented: $showingDeleteAlert) {
            Button("취소", role: .cancel) { }
            Button("삭제", role: .destructive) {
                deleteRecordDB(workoutRecord)
                dismiss()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("삭제") {
                    showingDeleteAlert = true
                }
            }
        }
    }
    
    private func getFeeling() -> String {
        return workoutRecord.feeling?.rawValue ?? ""
    }
}

//#Preview {
//    WorkoutDetailView()
//}
