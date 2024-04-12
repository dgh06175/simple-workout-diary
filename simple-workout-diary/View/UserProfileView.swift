//
//  SettingView.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/9/24.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: WorkoutVM

    var body: some View {
        Image(systemName: "gearshape")
            .font(.system(size: 150))
    }
}
