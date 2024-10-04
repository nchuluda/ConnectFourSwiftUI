//
//  C4App.swift
//  C4
//
//  Created by Nathan on 9/30/24.
//

import SwiftUI

@main
struct C4App: App {
    @StateObject var game = ConnectFourGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(game)
        }
    }
}
