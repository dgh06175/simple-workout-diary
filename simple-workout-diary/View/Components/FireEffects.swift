//
//  FireEffects.swift
//  simple-workout-diary
//
//  Created by 이상현 on 4/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FireEffect: View {
    var body: some View {
        AnimatedImage(name: "fire-flame.gif")
            .resizable()
    }
}

#Preview {
    Group {
        ZStack {
            FireEffect()
        }
    }
}
