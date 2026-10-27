//
//  BudgetStore.swift
//  PocketPay Watch App
//
//  Created by Owner on 2026-10-24.
//

import Foundation
import Combine

class BudgetStore : ObservableObject{
    
    @Published var expenses: [Expense] = []
    
    // My monthly budget is 500
    let monthlyBudget: Double  = 500
    
    // Calculate the total spent
    var totalSpent: Double{
        var total = 0.0
        
        for expense in expenses {
            total += expense.amount
        }
        
        return total
    }
    
    // Calaculate the reamining total
    var remaining: Double{
        monthlyBudget - totalSpent
    }
    
    //Create a function to add expenses
    
    func addExpense(category: String, amount: Double){
        //We want to record the date of the last expense
        let now = Date()
        
        let newexpense = Expense(category : category, amount: amount, date: now)
        expenses.append(newexpense)
    }
    
    func deleteExpense(_ index: Int) {
        guard index >= 0 && index < expenses.count else { return }
        expenses.remove(at: index)
    }
    
}
