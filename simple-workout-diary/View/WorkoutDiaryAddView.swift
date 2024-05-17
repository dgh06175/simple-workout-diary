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
    @State private var workoutDetails: [WorkoutDetail] = [
        WorkoutDetail(workoutType: WorkoutType.benchPress),
        WorkoutDetail(workoutType: WorkoutType.squat),
        WorkoutDetail(workoutType: WorkoutType.deadlift),
        WorkoutDetail(workoutType: WorkoutType.overHeadPress),
        WorkoutDetail(workoutType: WorkoutType.barbellRow)
    ]
    @State private var creationDate: Date = Date()
    
    @State private var showingExitConfirmation = false
    @State private var showingCompletionAlert = false
    @State private var showingFeelingPicker = false

    var body: some View {
        NavigationView {
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
            workoutDetails: workoutDetails,
            feeling: selectedFeeling
        )
        insertRecordDB(newRecord)
        dismiss()
    }
}

// MARK: - 경고창
private struct ExitConfirmationAlert: ViewModifier {
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

private struct CompletionConfirmationAlert: ViewModifier {
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

fileprivate struct WorkoutDiaryToolbar: ToolbarContent {
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
    ContentView()
        .modelContainer(sampleData)
}

struct WorkoutDetailInputView: View {
    @Binding var workoutDetail: WorkoutDetail
    @State var weight: Int = 0
    @State private var showingAlert = false
    @State private var inputWeight = ""
    
    let minWeightGap = 5
    
    var body: some View {
        Section {
            HStack {
                Image(workoutDetail.workoutType.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Spacer()
                    .frame(width: 20)
                Text(workoutDetail.workoutType.rawValue)
                    .fontWeight(.semibold)
                Spacer()
                
                Button(action: {
                    self.inputWeight = "\(workoutDetail.weight)"
                    self.showingAlert = true
                }, label: {
                    Text("\(workoutDetail.weight)kg")
                        .font(.title3)
                        .fontWeight(.semibold)
                })
                .alert("무게 입력", isPresented: $showingAlert) {
                    TextField("무게 입력", text: $inputWeight)
                    Button("확인", action: updateWeight)
                    Button("취소", role: .cancel) {}
                } message: {
                    Text("새로운 무게를 입력하세요.")
                }
                
                Button(action: {
                    if workoutDetail.weight >= minWeightGap {
                        workoutDetail.weight -= minWeightGap
                    }
                }, label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .scaledToFit()
                        Text("-\(minWeightGap)")
                    }
                })
                .frame(width: 40)
                
                Button(action: {workoutDetail.weight += minWeightGap}, label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .scaledToFit()
                        Text("+\(minWeightGap)")
                    }
                })
                .frame(width: 40)
                
            }
            .padding()
        }
    }
    private func updateWeight() {
            let newWeight = Int(inputWeight) ?? workoutDetail.weight
            workoutDetail.weight = newWeight
        }
}
