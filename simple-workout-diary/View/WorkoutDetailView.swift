//
//  WorkoutDetailView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/12/24.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var workoutRecord: WorkoutRecord
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(DateUtil.formattedCurrentDate(workoutRecord.creationDate))
                .font(.title)
            Text(workoutRecord.memo)
                .font(.body)
            Text(workoutRecord.feeling?.rawValue ?? "")
                .font(.caption)
            Spacer()
        }
        .navigationTitle("상세 기록")
        .alert("정말 삭제하시겠습니까?", isPresented: $showingDeleteAlert) {
            Button("취소", role: .cancel) { }
            Button("삭제", role: .destructive) {
                deleteRecord()
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
    
    
    private func deleteRecord() {
        modelContext.delete(workoutRecord)
    }
}

//#Preview {
//    WorkoutDetailView()
//}
