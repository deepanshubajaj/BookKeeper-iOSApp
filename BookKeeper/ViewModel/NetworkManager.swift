//
//  NetworkManager.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    @Published var books: [Book] = []
    
    func fetchBooks() {
        guard let url = URL(string: "https://gutendex.com/books") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching books: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.books = decodedResponse.results
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
