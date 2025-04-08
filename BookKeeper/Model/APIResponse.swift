//
//  APIResponse.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import Foundation

// MARK: - API Response Model
struct APIResponse: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Book]
}

