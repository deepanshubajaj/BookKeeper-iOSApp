//
//  BooksListView.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import SwiftUI

struct BooksListView: View {
    
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        NavigationView {
            List(networkManager.books) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    HStack {
                        
                        // Book image as a thumbnail
                        if let imageUrlString = book.formats["image/jpeg"], let imageUrl = URL(string: imageUrlString) {
                            AsyncImage(url: imageUrl) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 90)
                                    .cornerRadius(8)
                                    .shadow(radius: 3)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 60, height: 90)
                            }
                        } else {
                            // Fallback if no image is available
                            Image("placeholder-book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 90)
                                .cornerRadius(8)
                                .shadow(radius: 3)
                        }
                        
                        VStack(alignment: .leading) {
                            // Book Title
                            Text(book.title)
                                .font(.headline)
                                .foregroundColor(Color(red: 159/255, green: 82/255, blue: 85/255))
                                .lineLimit(1)
                                .padding(.bottom, 2)
                            
                            // Author name
                            if let firstAuthor = book.authors.first {
                                Text(firstAuthor.name)
                                    .font(.subheadline)
                                    .foregroundColor(Color(red: 95/255, green: 139/255, blue: 76/255))
                                    .lineLimit(1)
                            }
                            
                            // Publishing year
                            if let firstAuthor = book.authors.first {
                                let birthYearText = firstAuthor.birth_year != nil ? "Published: \(firstAuthor.birth_year!)" : "Published: Not Available"
                                Text(birthYearText)
                                    .font(.caption)
                                    .foregroundColor(Color(red: 225/255, green: 106/255, blue: 84/255))
                            }
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                    }
                    .padding(10)
                    .frame(height: 100)
                    .background(Color(red: 255/255, green: 221/255, blue: 171/255))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
                .listRowBackground(Color(red: 148/255, green: 80/255, blue: 52/255))
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 1) {
                        Spacer().frame(height: 12)
                        // Screen Title
                        Text("The Book Vault")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 255/255, green: 221/255, blue: 171/255))
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(Color(red: 95/255, green: 139/255, blue: 76/255))
        }
    }
}
