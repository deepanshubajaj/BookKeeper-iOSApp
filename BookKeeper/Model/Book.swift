//
//  Book.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import Foundation

// MARK: - Book Model
struct Book: Identifiable, Decodable {
    var id: Int
    var title: String
    var authors: [Person]
    var summaries: [String]
    var download_count: Int
    var formats: [String: String]  // The available formats for the books (text, pdf)
    
    var summary: String {
        return summaries.first ?? "No description available"
    }
}


