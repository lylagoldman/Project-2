//
//  ContentView.swift
//  Project 2 - Weather App
//
//  Created by Lyla Goldman on 10/20/25.
//

import SwiftUI

struct Hour {
    let id = UUID()
    var time: String
}

struct Day {
    let id = UUID()
    var name: String
}
struct HourlyRowView: View {
    let times = ["Now", "1PM", "2PM", "3PM", "4PM", "5PM"]
    let symbols = ["sun.max.fill", "cloud.sun.fill", "cloud.sun.rain.fill"]
    var body: some View {
        HStack {
            ForEach(times, id: \.self) { time in
                Text(time)
                    .fontWeight(.semibold)
                    .padding(.trailing, 19)
            }
            
        }
        
        HStack {
            Image(systemName: symbols[0])
                .symbolRenderingMode(.multicolor)
                .imageScale(.large)
                .font(.title)
            Image(systemName: symbols[0])
                .symbolRenderingMode(.multicolor)
                .imageScale(.large)
                .font(.title)
            Image(systemName: symbols[0])
                .symbolRenderingMode(.multicolor)
                .imageScale(.large)
                .font(.title)
            Image(systemName: symbols[1])
                .symbolRenderingMode(.multicolor)
                .imageScale(.large)
                .font(.title)
        }
        
    }
}

struct HourlyForecastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                    .fontWeight(.semibold)
                Text("HOURLY FORECAST")
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.bottom, 5)
            HourlyRowView()
        }
            
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            HourlyForecastView()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
