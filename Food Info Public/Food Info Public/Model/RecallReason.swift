//
//  RecallReason.swift
//  Food Info
//
//  Created by Nick Kasten on 2/22/23.
//

import Foundation

struct RecallReason: Hashable, Codable {
    var country: String
    var city: String
    var reason_for_recall: String
    var product_quantity: String
    var distribution_pattern: String
    var state: String
    var product_description: String
    var report_date: String
    var classification: String
    var recalling_firm: String
    var recall_number: String
    var product_type: String
    var event_id: String
    var termination_date: String?
    var recall_initiation_date: String
    var status: String
}

struct RecallReasonMetaResults: Hashable, Codable {
    var skip: Int?
    var limit: Int?
    var total: Int
}

struct RecallReasonMeta: Hashable, Codable {
    var disclaimer: String?
    var license: String?
    var last_updated: String
    var results: RecallReasonMetaResults
}

struct RecallReasonSearchPage: Hashable, Codable {
    var meta: RecallReasonMeta
    var results: [RecallReason]
}
