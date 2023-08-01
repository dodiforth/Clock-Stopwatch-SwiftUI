//
//  TabBar.swift
//  Clock-Stopwatch
//
//  Created by Dowon Kim on 01/08/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Text("World Clock")
                .tabItem {
                    Image(systemName: "globe")
                    Text("World Clock")
                }
            Text("Alarm")
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Alarm")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "stopwatch.fill")
                    Text("StopWatch ")
                }
            Text("Timer")
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }
        }
        .accentColor(.orange)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
