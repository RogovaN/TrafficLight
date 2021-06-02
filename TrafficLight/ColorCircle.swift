//
//  RedCircle.swift
//  TrafficLight
//
//  Created by Наталья Рогова on 01.06.2021.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color .white, lineWidth: 4))
            .shadow(radius: 10)
            .padding(.top)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red)
    }
}
