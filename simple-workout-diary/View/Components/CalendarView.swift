//
//  CalendarView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/12/24.
//

import SwiftUI

struct CalendarView: View {
    @State var month: Date
    var workoutRecords: [WorkoutRecord]
    let deleteRecordDB: (WorkoutRecord) -> Void

    @State var offset: CGSize = CGSize()
    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
        .padding(40)
    }
    
    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack (spacing: 30) {
                Text(month.formattedDateYearMonth())
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {changeMonth(by: -1)}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12)
                })
                Button(action: {changeMonth(by: 1)}, label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                })
            }
            .padding(.horizontal)
            .padding(.bottom)
            HStack {
                ForEach(Self.weekdaySymbolsKR, id: \.self) { symbol in
                    Text(symbol)
                        .foregroundStyle(Color.gray)
                        .opacity(0.6)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        //let clicked = workoutDates.contains(date)
                        let record = workoutRecord(for: date)
                        
                        CellView(day: day, record: record, deleteRecordDB: deleteRecordDB)
//                            .onTapGesture {
//                                if clicked {
//                                    workoutDates.remove(date)
//                                } else {
//                                    workoutDates.insert(date)
//                                }
//                            }
                        
                    }
                }
            }
        }
    }
}

// MARK: - 일자 셀 뷰
private struct CellView: View {
    var day: Int
    var record: WorkoutRecord?
    let deleteRecordDB: (WorkoutRecord) -> Void
    
    init(day: Int, record: WorkoutRecord?, deleteRecordDB: @escaping (WorkoutRecord) -> Void) {
        self.day = day
        self.record = record
        self.deleteRecordDB = deleteRecordDB
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.clear)
                .overlay(Text(String(day)))
                .foregroundColor(.black)
            if let record = record {
                NavigationLink(destination: WorkoutDetailView(
                    workoutRecord: record,
                    deleteRecordDB: deleteRecordDB
                )) {
                    FireEffect()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(y: -3)
                }
            }
        }
        .frame(width: .infinity, height: 50)
    }
}

// MARK: - 내부 메서드
private extension CalendarView {
    /// 특정 해당 날짜
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
    
    // 날짜에 맞는 기록 찾기
    func workoutRecord(for date: Date) -> WorkoutRecord? {
        workoutRecords.first(where: { $0.creationDate.startOfDay() == date.startOfDay() })
    }
}

// MARK: - Static 프로퍼티
extension CalendarView {
    
    static let weekdaySymbolsKR = ["일", "월", "화", "수", "목", "금", "토"]
    static let weekdaySymbols = Calendar.current.shortStandaloneWeekdaySymbols
}
