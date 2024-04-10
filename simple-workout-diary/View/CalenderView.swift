//
//  CalenderView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct CalenderView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Image(systemName: "calendar")
                .font(.system(size: 150))
            DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Text("선택된 날짜: \(selectedDate, formatter: itemFormatter)")
        }
        .padding()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    CalenderView()
}
