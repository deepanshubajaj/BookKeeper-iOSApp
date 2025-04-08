//
//  BookDetailView.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 08/04/25.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Book image
                if let imageUrlString = book.formats["image/jpeg"], let imageUrl = URL(string: imageUrlString) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                            
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .frame(width: 250, height: 375)
                            
                        case .success(let image):
                            // Loaded image
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 375)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding()
                            
                        case .failure:
                            // Fallback if image loading fails, show a default image
                            Image("placeholder-book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 375)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding()
                        @unknown default:
                            // Handle unexpected cases (iOS 15+)
                            EmptyView()
                        }
                    }
                } else {
                    // If the URL is not valid, show a fallback image
                    Image("placeholder-book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 375)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                }
                
                // Book title
                Text(book.title)
                    .font(.title)
                    .foregroundColor(Color(red: 124/255, green: 68/255, blue: 79/255))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity)
                
                // Authors
                Text(book.authors.map { $0.name }.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(Color(red: 26/255, green: 26/255, blue: 25/255))
                    .padding(.bottom, 5)
                    .multilineTextAlignment(.center)
                
                // Summary/Description
                if let description = book.summaries.first {
                    Text(description)
                        .font(.body)
                        .padding(.bottom, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .foregroundColor(Color(red: 95/255, green: 139/255, blue: 76/255))
                }
                
                // Publishing Year
                if let firstAuthor = book.authors.first {
                    let birthYearText = firstAuthor.birth_year != nil ? "Published: \(firstAuthor.birth_year!)" : "Published: Not Available"
                    Text(birthYearText)
                        .font(.caption)
                        .foregroundColor(Color(red: 112/255, green: 119/255, blue: 161/255))
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.center)
                }
                
                // Download count
                Text("Downloads: \(book.download_count)")
                    .font(.caption)
                    .foregroundColor(Color(red: 118/255, green: 69/255, blue: 59/255))
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                
                // Download link Button
                if let firstFormatURL = book.formats.first?.value, let url = URL(string: firstFormatURL) {
                    Button(action: {
                        // Open the URL in the default browser
                        UIApplication.shared.open(url)
                    }) {
                        HStack {
                            Image(systemName: "arrow.down.circle.fill")
                                .foregroundColor(.white)
                            Text("Download Book")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(red: 124/255, green: 68/255, blue: 79/255))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    .padding(.top)
                } else {
                    // Fallback message if no download URL is available
                    Text("Download link is unavailable for this book.")
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
            .background(Color(red: 255/255, green: 221/255, blue: 171/255))
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
