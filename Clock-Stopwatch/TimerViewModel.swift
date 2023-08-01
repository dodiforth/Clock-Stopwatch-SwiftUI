//
//  TimerViewModel.swift
//  Clock-Stopwatch
//
//  Created by Dowon Kim on 01/08/2023.
//

import SwiftUI
//Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.
import Combine


class TimerViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 60 //Initial time in seconds
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.stopTimer()
            }
        })
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
