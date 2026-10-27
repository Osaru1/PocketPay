//
//  PocketPayApp.swift
//  PocketPay Watch App
//
//  Created by Owner on 2026-10-23.
//

import SwiftUI

@main
struct PocketPay_Watch_AppApp: App {
    @StateObject var store = BudgetStore() //Create the one shared BudgetStore when the app starts. Hand it to every screen
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)  // every screen can read from this environment and the published alerts when state changed
        }
    }
}
