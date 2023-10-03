//
//  SearchView.swift
//  Food Info
//
//  Created by Nick Kasten on 3/12/23.
//

import SwiftUI

struct SearchView: View {
    @State var search: String = ""
    @State var limit: Double = 1.0
    var index: Int = 0
    
    @State var totalFound: Int = 0
    @State var isLoading = false
    @State var searchResults: [RecallReason]?
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.blue],
        startPoint: .bottom, endPoint: .top)
    let reverseGradient = LinearGradient(
        colors: [Color.blue, Color.white],
        startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        //NavigationStack {
        VStack {
            TextField("Search for Recalls ... ", text: $search)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .padding()
                .font(.system(size:30))
                .background((search == "") ? reverseGradient: backgroundGradient)
                .animation(isLoading ? .linear(duration: 10000):.spring()) // use linear to prevent it from jittering back and forth
            if isLoading {
                ProgressView()
            } else if search == "" {
                
            } else if let searchResults {
                // now that it is unpacked from it's optional-ness, let's allow for the limiting of the list
                if totalFound != 1 {
                    SliderView(total: Double(totalFound), innerLimit: $limit)
                        .shadow(radius: 1)
                } else {
                    Text("\(totalFound) Results")
                        .foregroundColor(.primary)
                        .font(.title2)
                }
                
                NavigationStack {
                    List (searchResults.prefix(Int(limit)), id: \.recall_number) { item in
                        NavigationLink {
                            FoodRecallView(search: item)
                        } label: {
                            FoodRecallBlock(search: item)
                        }
                    }
                }
            }
        }
        //}
        .navigationTitle("Recall Results")
        .task(id: "\(search)") {
            if search != "" {
                isLoading = true
            }
            
            let withPlus = spaceToPlus(search: search)
            print(withPlus)
            do {
                // grab the total amount of possibilities
                let firstLoad = try await searchFDAFood(search: withPlus, limit: 1)
                totalFound = firstLoad.meta.results.total
                
                // as per USDA, the search limit cannot exceed 1000
                if totalFound > 1000 {
                    totalFound = 1000
                }
                
                // use total amount to load all into a single variable to remove the need for refreshing each time
                let response = try await searchFDAFood(search: withPlus, limit: totalFound)
                searchResults = response.results
                
                
            } catch {
                print(error)
                searchResults = nil
            }
            isLoading = false
        }
    }
    
    func spaceToPlus(search: String) -> String {
        if search.firstIndex(of: " ") != nil {
            let plus = search.replacingOccurrences(
                of: " ", with: "+")
            return plus
        }
        return search
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(search: "")
    }
}
