//
//  WorkoutViewModel.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/10/24.
//

import SwiftUI

// 뷰모델은 뮤와 모델 사이의 매개체 역할을 한다. 뷰에 표시될 데이터와 뷰의 상태를 관리한다.
// 뷰모델은 모델로부터 데이터를 가져와 뷰가 사용할 수 있는 형태로 반환하고, 사용자의 액션에 대한 응답으로 모델을 업데이트한다.

final class WorkoutVM: ObservableObject{
    @Published var records: [WorkoutRecord]
    
    init(records: [WorkoutRecord] = []) {
        self.records = records
    }
}
