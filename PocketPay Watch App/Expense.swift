//
//  Expense.swift
//  PocketPay Watch App
//
//  Created by Owner on 2026-10-24.
//

import Foundation

// My data for the Expense app
struct Expense: Identifiable {
    let category : String
    let amount :  Double
    let date : Date
    let id =  UUID()

}
