//
//  Slider.swift
//  Food Info
//
//  Created by Nick Kasten on 3/15/23.
//

import SwiftUI

struct SliderView: View {
    @State private var interact = false
    var total: Double
    @Binding var innerLimit: Double
    
    var body: some View {
        VStack {
            Text("\(Int(innerLimit)) Results")
                .foregroundColor(interact ? .blue : .primary)
                .animation(Animation.easeInOut(duration: 0.25))
                .font(interact ? .title : .title2)
                .contentTransition(.interpolate)
            Slider(value: $innerLimit, in: 1...total, step: 1) {
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("\(Int(total))")
            } onEditingChanged: { editing in
                interact = editing
            }
            
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    @State static var giveLimit: Double = 1.0
    static var previews: some View {
        SliderView(total: 100, innerLimit: $giveLimit)
    }
}
