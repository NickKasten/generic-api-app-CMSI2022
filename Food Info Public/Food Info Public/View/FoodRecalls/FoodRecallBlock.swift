//
//  SwiftUIView.swift
//  Food Info
//
//  Created by Nick Kasten on 3/8/23.
//

import SwiftUI

struct FoodRecallBlock: View {
    
    var search: RecallReason?
    
    func sliceMaker(prodDescr: String) -> Int {
        let begin = prodDescr.startIndex

        let punctuation: Array<Character> = [",",".",";","("]
        var legalDist: Array<Int> = []
        
        for char in punctuation {
          if let charDist = prodDescr.firstIndex(of: char) {
            legalDist.append(prodDescr.distance(from: begin, to: charDist))
          } else {
            continue
          }
        }
        legalDist.sort()
        if legalDist.isEmpty {
            return prodDescr.count
        }
        return legalDist[0]
    }
    
    var body: some View {
        HStack {
            if let search {
                //making out description easier to read
                let prodDescr = search.product_description
                //now grab the index of the smallest we can cut it
                let sliceDest = sliceMaker(prodDescr: prodDescr)
                
                Text(prodDescr.prefix(sliceDest))
                    .font(.headline)
                    .padding(.leading)
                Spacer()
                // formatting the date correctly
                let date = search.recall_initiation_date
                let day = date.suffix(2)
                let month = date.dropLast(2).suffix(2) as Substring
                let year = date.prefix(4)
                Text(month + "/" + day + "/" + year)
                    .font(.subheadline)
                    .padding(.trailing)
                
            }
        }
    }
}

struct FoodRecallBlock_Previews: PreviewProvider {
    static var previews: some View {
        FoodRecallBlock(search: RecallReason(country: "US", city: "Sacramento", reason_for_recall: "Reason for recall", product_quantity: "10 billion", distribution_pattern: "funny", state: "CA", product_description: "Description ajdfals j", report_date: "2023", classification: "", recalling_firm: "", recall_number: "", product_type: "", event_id: "", recall_initiation_date: "20230313", status: "Terminated"))
    }
}
