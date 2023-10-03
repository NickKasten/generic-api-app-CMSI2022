//
//  FoodRecallView.swift
//  Food Info
//
//  Created by Nick Kasten on 2/22/23.
//

import SwiftUI

struct FoodRecallView: View {
    //    var search: String
    //    var index: Int
    var search: RecallReason?
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.blue],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment:.center) {
                    if let search {
                        Text("\(search.product_description)")
                            .font(.system(size:30, design: .monospaced))
                            .frame(width:350)
                            .padding(.bottom)
                        let location = "Location: " + search.city + ", " + search.state + ", " + search.country + "."
                        (Text("\(location)\nRecall Report Date: \(search.report_date)\nRecall Initiation Date: \(search.recall_initiation_date)\nStatus: \(search.status)"))
                            .font(.system(size:15, design: .monospaced))
                            .padding(5)
                        
                        Text("Reason for Recall:")
                            .underline()
                            .font(.system(size:20, design: .monospaced))
                        Text(search.reason_for_recall)
                            .font(.system(size:17.5, design: .monospaced))
                            .frame(width:350)
                            .padding(5)
                        //                if let search.status = status {
                        //                    Text(status)
                    }
                }
            }
        }
    }
}

struct FoodRecallView_Previews: PreviewProvider {
    static var previews: some View {
        FoodRecallView(search: RecallReason(country: "US", city: "Sacramento", reason_for_recall: "Reason for recall", product_quantity: "10 billion", distribution_pattern: "funny", state: "CA", product_description: "Description", report_date: "2023", classification: "", recalling_firm: "", recall_number: "asjdfimcap", product_type: "", event_id: "", recall_initiation_date: "03132023", status: "Terminated"))
    }
}
