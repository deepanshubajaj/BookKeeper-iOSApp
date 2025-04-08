//
//  ContentView.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        Group {
            if networkManager.books.isEmpty {
                ZStack {
                    // Loader Background
                    Color(red: 220/255, green: 215/255, blue: 201/255)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                        
                        // Loading Message
                        Text("Loading Books...")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                    }
                }
                .onAppear {
                    networkManager.fetchBooks()  // Fetch books when the view appears
                }
            } else {
                BooksListView(networkManager: networkManager)
            }
        }
    }
}


