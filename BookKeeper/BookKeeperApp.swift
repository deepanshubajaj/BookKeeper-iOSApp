//
//  BookKeeperApp.swift
//  BookKeeper
//
//  Created by Deepanshu Bajaj on 07/04/25.
//

import SwiftUI

@main
struct BookKeeperApp: App {
    
    @StateObject private var networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(networkManager: networkManager)
        }
    }
}





