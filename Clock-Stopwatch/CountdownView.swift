//
//  CountdownView.swift
//  Clock-Stopwatch
//
//  Created by Dowon Kim on 01/08/2023.
//

import SwiftUI

struct CountdownView: View {
    
    @ObservedObject var viewModel: TimerViewModel
    @State private var animationAmount: Double = 1.0
    
    var body: some View {
        
        VStack {
            Text("\(Int(viewModel.remainingTime))")
                .font(.largeTitle)
                .scaleEffect(animationAmount) // Apply animation to the countdown label
        }
        .onAppear {
            viewModel.startTimer()
        }
        .onReceive(viewModel.$remainingTime) { time in
            withAnimation(.easeOut(duration: 1)) {
                // Trigger the animation when the remaining time changes
                animationAmount = 1.2 // Can adjust this value for a more noticeable effect 
            }
        }
    }
    
}

