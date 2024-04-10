//
//  Item.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
