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
        AnimatedImage(name: "flame.gif")
            .playbackRate(Double.random(in: 0.8...1.2))
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
