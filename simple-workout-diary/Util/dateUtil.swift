//
//  dateUtil.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/12/24.
//

import Foundation

struct DateUtil {
    static func formattedCurrentDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter.string(from: date)
    }
}
