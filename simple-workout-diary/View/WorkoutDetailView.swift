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
    let memo_old: String
    @State var memo: String
    @State var workoutDetails: [WorkoutDetail]

    @Environment(\.dismiss) var dismiss
    @State private var showingExitConfirmation = false
    @State private var showingCompletionAlert = false
    @State private var showingDeleteAlert = false

    init(workoutRecord: WorkoutRecord,
         deleteRecordDB: @escaping (WorkoutRecord) -> Void
    ) {
        self.workoutRecord = workoutRecord
        self.deleteRecordDB = deleteRecordDB
        self.memo_old = "\(workoutRecord.memo)"
        self.memo = workoutRecord.memo
        self.workoutDetails = workoutRecord.workoutDetails
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.gray.opacity(0.15))
                TextField("운동에 대한 메모를 입력하세요", text: $memo)
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            .frame(height: 40)
            ForEach($workoutDetails) { workoutDetail in
                WorkoutDetailInputView(workoutDetail: workoutDetail)
            }
            Spacer()
        }
        .onDisappear {
            workoutRecord.memo = memo
        }
        .navigationTitle(workoutRecord.creationDate.formattedDateYearMonthDay())
        .modifier(
            DeleteConfirmationAlert(
                isPresented: $showingDeleteAlert,
                onConfirm: {
                    deleteRecordDB(workoutRecord)
                    dismiss()
                }
            ))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: { showingDeleteAlert = true }){
                    Text("삭제")
                        .foregroundStyle(Color.red)
                }
            }
        }
    }
    
    private func getFeeling() -> String {
        return workoutRecord.feeling?.rawValue ?? ""
    }
}

struct DeleteConfirmationAlert: ViewModifier {
    @Binding var isPresented: Bool
    var onConfirm: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert("정말 삭제하시겠습니까?", isPresented: $isPresented) {
                Button("취소", role: .cancel) { }
                Button("삭제", role: .destructive) {
                    onConfirm()
                }
            }
    }
}

#Preview {
    ContentView()
        .modelContainer(sampleData)
}
