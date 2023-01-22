//
//  WeatherButton.swift
//  Weather-SwiftUI
//
//  Created by Swaminathan Venkataraman on 1/22/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(bgColor)
            .font(.system(size: 20, weight: .medium))
            .cornerRadius(11.0)
            .foregroundColor(textColor)
        
    }
}

