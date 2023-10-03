//
//  SearchField.swift
//  Food Info
//
//  Created by Nick Kasten on 3/16/23.
//

import SwiftUI

struct SearchField: View {
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.blue],
        startPoint: .bottom, endPoint: .top)
    let sillyBlue = LinearGradient(
        colors: [Color.blue, Color.white],
        startPoint: .bottom, endPoint: .top)
    
    @State var search: String
    
    var body: some View {
        TextField("Search for Recalls ... ", text: $search)
            .autocorrectionDisabled()
            .textFieldStyle(.roundedBorder)
            .padding()
            .font(.system(size:30))
            .background((search == "") ? sillyBlue: backgroundGradient)
            .animation(.spring())
    }
}

struct SearchField_Previews: PreviewProvider {
    @State static var theSearch: String = "Cheerio"
    static var previews: some View {
        SearchField(search: theSearch)
    }
}
