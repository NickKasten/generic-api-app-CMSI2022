//
//  FDARecallReasonAPI.swift
//  Food Info
//
//  Created by Nick Kasten on 2/22/23.
//

import Foundation

let FDA_API_ROOT = "https://api.fda.gov/food/enforcement.json"
let FDA_API_KEY = "Aadlck4mEkPDpDvudcSEG3aIEeCGJlvWHsSbtjza"
let SEARCH_ENDPOINT = "\(FDA_API_ROOT)?api_key=\(FDA_API_KEY)&search"


enum FDA_APIError: Error {
    case badUrl
    case unsuccessfulDecode
}

func searchFDAFood(search: String, limit: Int) async throws -> RecallReasonSearchPage {
    // trying to make our URL
    guard let url = URL(string: "\(SEARCH_ENDPOINT)=product_description:\(search)&limit=\(limit)") else {
        throw FDA_APIError.badUrl
    }
    
    print("here is our URL: \(url.absoluteString)")
    
    // trying to load said data
    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(RecallReasonSearchPage.self, from: data) {
        print(decodedPage)
        return decodedPage
    } else {
        throw FDA_APIError.unsuccessfulDecode
    }
    
}


