//
//  DiaryAddView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import SwiftUI

struct WorkoutDiaryAddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: WorkoutVM
    
    @State private var memo: String = ""
    @State private var selectedFeeling: WorkoutFeeling?
    
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
            .navigationTitle(DateUtil.formattedCurrentDate(Date()))
            .toolbar { toolbarContent }
            .alert("나가기", isPresented: $showingExitConfirmation) {
                Button("취소", role: .cancel) { }
                Button("확인", role: .destructive) {
                    dismiss()
                }
            } message: {
                Text("정말로 나가시겠습니까? 입력한 정보가 저장되지 않습니다.")
            }
            .alert("정말 완료하시겠습니까?", isPresented: $showingCompletionAlert) {
                Button("취소", role: .cancel) { }
                Button("완료", role: .destructive) {
                    showingFeelingPicker = true
                }
            }
        }
        .sheet(isPresented: $showingFeelingPicker,content: feelingPickerSheet)
    }
    
    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: checkForUnsavedChanges) {
                    Image(systemName: "chevron.backward")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("완료") {
                    showingCompletionAlert = true
                }
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
            createAndSaveRecord()
        }
    }
    
    private func createAndSaveRecord() {
        let newRecord = WorkoutRecord(creationDate: Date(), memo: memo, feeling: selectedFeeling)
        viewModel.createRecord(record: newRecord)
        dismiss()
    }
}

private struct FeelingPickerView: View {
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
    BottonTapView(viewModel: WorkoutVM(records: MockWorkoutData.mockWorkoutRecords))
}
