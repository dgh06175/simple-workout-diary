//
//  DiaryAddView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import SwiftUI
import SwiftData

struct WorkoutDiaryAddView: View {
    var workoutRecords: [WorkoutRecord]
    let insertRecordDB: (WorkoutRecord) -> Void
    
    @Environment(\.dismiss) var dismiss
    @State private var memo: String = ""
    @State private var selectedFeeling: WorkoutFeeling?
    @State private var creationDate: Date = Date()

    @State private var showingExitConfirmation = false
    @State private var showingCompletionAlert = false
    @State private var showingFeelingPicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("메모")) {
                    TextField("운동에 대한 메모를 입력하세요", text: $memo)
                }
            }
            .navigationTitle(creationDate.formattedDateYearMonthDay())
            .toolbar {
                WorkoutDiaryToolbar(
                    checkForUnsavedChanges: checkForUnsavedChanges,
                    showCompletionAlert: { showingCompletionAlert = true }
                )
            }
            .modifier(
                ExitConfirmationAlert(
                    isPresented: $showingExitConfirmation,
                    onConfirm: { dismiss() }
                ))
            .modifier(
                CompletionConfirmationAlert(
                    isPresented: $showingCompletionAlert,
                    onConfirm: { showingFeelingPicker = true }
                ))
        }
        .sheet(isPresented: $showingFeelingPicker) {
            FeelingPickerView(selectedFeeling: $selectedFeeling) {
                createRecord()
            }
        }
    }
    
    private func checkForUnsavedChanges() {
        if !memo.isEmpty {
            showingExitConfirmation = true
        } else {
            dismiss()
        }
    }
    
    private func feelingPickerSheet() -> some View {
        FeelingPickerView(selectedFeeling: $selectedFeeling) {
            createRecord()
        }
    }
    
    private func createRecord() {
        let newRecord = WorkoutRecord(
            creationDate: creationDate,
            memo: memo,
            feeling: selectedFeeling
        )
        insertRecordDB(newRecord)
        dismiss()
    }
}

struct ExitConfirmationAlert: ViewModifier {
    @Binding var isPresented: Bool
    var onConfirm: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert("나가기", isPresented: $isPresented) {
                Button("취소", role: .cancel) { }
                Button("확인", role: .destructive, action: onConfirm)
            } message: {
                Text("정말로 나가시겠습니까? 입력한 정보가 저장되지 않습니다.")
            }
    }
}

struct CompletionConfirmationAlert: ViewModifier {
    @Binding var isPresented: Bool
    var onConfirm: () -> Void

    func body(content: Content) -> some View {
        content
            .alert("정말 완료하시겠습니까?", isPresented: $isPresented) {
                Button("취소", role: .cancel) { }
                Button("완료", role: .destructive, action: onConfirm)
            }
    }
}

struct WorkoutDiaryToolbar: ToolbarContent {
    var checkForUnsavedChanges: () -> Void
    var showCompletionAlert: () -> Void

    var body: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: checkForUnsavedChanges) {
                    Image(systemName: "chevron.backward")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("완료", action: showCompletionAlert)
            }
        }
    }
}

struct FeelingPickerView: View {
    @Binding var selectedFeeling: WorkoutFeeling?
    var onConfirm: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                Text("오늘의 운동은 어떠셨나요?")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 30)
                HStack {
                    ForEach(WorkoutFeeling.allCases, id: \.self) { feelingOption in
                        Text(feelingOption.rawValue)
                            .font(.system(size: 50))
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                selectedFeeling = feelingOption
                                onConfirm()
                            }
                    }
                }
            }
        }
        .presentationDetents([.height(180)])
    }
}

#Preview {
    ContentView()
        .modelContainer(sampleData)
}
