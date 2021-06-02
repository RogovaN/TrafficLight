//
//  ContentView.swift
//  TrafficLight
//
//  Created by Наталья Рогова on 01.06.2021.
//

import SwiftUI

enum Light {
    case none, red, yellow, green
}

struct ContentView: View {
    @State var buttonTitle: String = "Start"
    @State var activeLight: Light = .none
    
    var body: some View {
        
        ZStack {
            Color .black
                .ignoresSafeArea()
            VStack {
                ColorCircle(color: getColor(.red))
                ColorCircle(color: getColor(.yellow))
                ColorCircle(color: getColor(.green))
                Spacer()
                
                Button(action: startButtonPressed) {
                    Text(buttonTitle)
                        .font(.title)
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5))
                }
            }
            .padding(.bottom, 30)
        }
    }
    
    private func getColor(_ light: Light) -> Color {
        var result: Color
        switch light {
        
        case .red:
            result = Color.red
        case .yellow:
            result = Color.yellow
        case .green:
            result = Color.green
        case .none:
            result = Color.gray
        }
        
        if activeLight != light {
            result = result.opacity(0.2)
        }
        return result
    }
    
    private func startButtonPressed() {
        buttonTitle = "Next"
        
        switch activeLight {
        
        case .red:
            activeLight = .yellow
        case .yellow:
            activeLight = .green
        case .green:
            activeLight = .red
        case .none:
            activeLight = .red
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
