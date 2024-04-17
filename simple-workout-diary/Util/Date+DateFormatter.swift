//
//  Date+DateFormatter.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/13/24.
//

import SwiftUI

extension Date {
    func formattedDateYearMonthDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: self)
    }
    
    func formattedDateYearMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM"
        return dateFormatter.string(from: self)
    }
    
    func formattedDateDayKR() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self) + "일"
    }
}

extension Date {
    func startOfDay() -> Date {
        Calendar.current.startOfDay(for: self)
    }
    
    func isSameDate(date: Date) -> Bool {
        self.startOfDay() == date.startOfDay()
    }
}
