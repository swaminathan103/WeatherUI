//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Swaminathan Venkataraman on 1/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Buffalo, NY")
                CenterWeatherView(imageName: isNight ? "moon.stars.fill" : "sun.dust.fill", temperature: 41)
                HStack(spacing:20) {
                    WeatherDayView(dayOfTheWeek: "TUE",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 32)
                    WeatherDayView(dayOfTheWeek: "WED",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 37)
                    WeatherDayView(dayOfTheWeek: "THUR",
                                   imageName: "cloud.fog.fill",
                                   temperature: 34)
                    WeatherDayView(dayOfTheWeek: "FRI",
                                   imageName: "wind.snow",
                                   temperature: 19)
                    WeatherDayView(dayOfTheWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 23)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change time of day",
                                  textColor: .blue,
                                  bgColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing:10) {
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? Color("darkGrey") : Color("lightBlue")
                                                  ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct CenterWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing:20) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text ("\(temperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
