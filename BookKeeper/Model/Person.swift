//
//  Person.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import Foundation

// MARK: - Person Model
struct Person: Identifiable, Decodable {
    var id: Int?
    var name: String
    var birth_year: Int?
    var death_year: Int? 
}
