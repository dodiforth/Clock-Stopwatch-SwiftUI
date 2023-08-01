//
//  ContentView.swift
//  Clock-Stopwatch
//
//  Created by Dowon Kim on 01/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timerElapsed: TimeInterval = 0
    @State private var isRunning = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(timeString(time:timerElapsed))")
                .font(.system(size: 90))
                .fontWeight(.ultraLight)
                .padding()
                .foregroundColor(.white)
                .offset(y: -50)
            HStack{
                Button(action: resetTimer) {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 41)
                                    .stroke(Color(red: 0.19, green: 0.19, blue: 0.19), lineWidth: 82)
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 85, height: 85)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(100)
                        
                        Text("Reset")
                            .font(Font.custom("Inter", size: 22))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
    }
    
    private func startTimer() {
        isRunning = true
    }
    private func stopTimer() {
        isRunning = false
    }
    private func resetTimer() {
        isRunning = false
        timerElapsed = 0
    }
    private func timeString(time: TimeInterval) -> String{
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int((time.truncatingRemainder(dividingBy: 1))*100)
        return String(format: "%02d.%02d:%02d", minutes, seconds, miliseconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
