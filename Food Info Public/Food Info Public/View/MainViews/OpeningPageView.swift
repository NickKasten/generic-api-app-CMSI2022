//
//  OpeningPageView.swift
//  Food Info
//
//  Created by Nick Kasten on 3/15/23.
//

import SwiftUI

struct OpeningPageView: View {
    private static let font1 = Font.system(size: 20)
    private static let font2 = Font.system(size: 45)

    @State private var color = Color.red
    @State private var currentFont = font1

    var body: some View {
        VStack {
            Text("Content transition")
                .foregroundColor(color)
                .font(currentFont)
                .contentTransition(.interpolate)
            Spacer()
            Button("Change") {
                withAnimation(Animation.easeInOut(duration: 5.0)) {
                    color = (color == .red) ? .green : .red
                    currentFont = ((currentFont == OpeningPageView.font1) ? OpeningPageView.font2 : OpeningPageView.font1)
                }
            }
        }
    }
}

struct OpeningPageView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningPageView()
    }
}
