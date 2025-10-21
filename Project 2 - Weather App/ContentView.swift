//
//  ContentView.swift
//  Project 2 - Weather App
//
//  Created by Lyla Goldman on 10/20/25.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}

struct TitleView: View {
    
    var body: some View {
        VStack {
            Text("MY LOCATION")
                .fontWeight(.regular)
            Text("Chapel Hill")
                .font(.system(size: 35, weight: .regular))
            Text("67°")
                .font(.system(size: 100, weight: .thin))
                .foregroundColor(.white)
                .padding(.leading)

            Text("Sunny")
                .font(.system(size: 20, weight: .semibold))
            Text("H:75°   L:41°")
                .fontWeight(.semibold)
        }
        .foregroundColor(.white)
    }
}
struct HourlyRowView: View {
    let times = ["Now", "1PM", "2PM", "3PM", "4PM", "5PM"]
    let weatherSymbols = ["sun.max.fill", "cloud.sun.fill", "cloud.rain.fill", "cloud.fill"]
    let todayTemperatures = ["67°", "70°","73°", "74°", "74°", "73°"]
    
    func createSymbol(symbol: String) -> some View {
        Image(systemName: symbol)
            .symbolRenderingMode(.multicolor)
            .imageScale(.medium)
            .font(.largeTitle)
    }
    
    func createHourlyTempView(index: Int, symbolIndex: Int) -> some View {
        VStack {
                Text(times[index])
                    .fontWeight(.bold)
                    .padding(.bottom, 3)
                
                createSymbol(symbol: weatherSymbols[symbolIndex])
                .padding(.bottom, 3)
            
                Text(todayTemperatures[index])
                    .fontWeight(.bold)
                    .font(.title2)
            }
        }
    
    var body: some View {
      HStack {
                createHourlyTempView(index: 0, symbolIndex: 0)
                    .padding(.trailing, 10)
                createHourlyTempView(index: 1, symbolIndex: 0)
                    .padding(.trailing, 10)
                createHourlyTempView(index: 2, symbolIndex: 0)
                    .padding(.trailing, 10)
                createHourlyTempView(index: 3, symbolIndex: 1)
                    .padding(.trailing, 10)
                createHourlyTempView(index: 4, symbolIndex: 0)
                    .padding(.trailing, 10)
                createHourlyTempView(index: 5, symbolIndex: 1)
        }
    }
}

struct HourlyForecastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                    .fontWeight(.bold)
                Text("HOURLY FORECAST")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 5)
            .padding(.bottom, 5)
            
            HourlyRowView()
        }
    }
}
struct ContentView: View {
    let blockColor: Color = Color(red: 22/255.0, green: 146/255.0, blue: 243/255.0)
    let backgroundGradient = LinearGradient(
        colors: [Color(red: 26/255.0, green: 152/255.0, blue: 242/255.0), Color(red: 98/255.0, green: 178/255.0, blue: 240/255.0)],
            startPoint: .top,
            endPoint: .bottom
        )

    var body: some View {
        ZStack {

            VStack {
                TitleView()
                    .padding(.bottom, 60)
                HourlyForecastView()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                        .background(blockColor)
                        .cornerRadius(15)
                        .frame(width: 380)
                       
                Spacer()
            }
            .padding(.top, 110)
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(backgroundGradient)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
