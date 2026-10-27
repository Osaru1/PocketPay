//
//  PocketPay_Watch_AppTests.swift
//  PocketPay Watch AppTests
//
//  Created by Owner on 2026-10-23.
//

import XCTest
@testable import PocketPay_Watch_App

final class BudgetStoreTests: XCTestCase {

    func testAddExpenseLowersRemaining() {
        let store = BudgetStore()
        store.addExpense(category: "Food", amount: 20)
        XCTAssertEqual(store.remaining, 480)
    }

    // Regression tests
    // bug I fixed: deleting a bad index used to crash, deleting something in a list that wasnt there
    func testDeleteInvalidIndexDoesNotCrash() {
        let store = BudgetStore()
        store.addExpense(category: "Food", amount: 20)
        store.deleteExpense(5)
        store.deleteExpense(-1)
        XCTAssertEqual(store.expenses.count, 1)
    }

    // deleting should give the money back, makes sure it actually gives the money back
    func testDeleteRestoresRemaining() {
        let store = BudgetStore()
        store.addExpense(category: "Food", amount: 20)
        store.deleteExpense(0)
        XCTAssertEqual(store.remaining, 500)
    }

    // bug I fixed: total used to be an Int, so cents broke. makes sure cents add up correctly
    func testCentsAreKept() {
        let store = BudgetStore()
        store.addExpense(category: "Fun", amount: 12.50)
        XCTAssertEqual(store.remaining, 487.50)
    }

    // Stress test: 1000 expenses, nothing gets lost and the math still holds
    func testStressThousandExpenses() {
        let store = BudgetStore()
        for _ in 1...1000 {
            store.addExpense(category: "Food", amount: 1)
        }
        XCTAssertEqual(store.expenses.count, 1000)
        XCTAssertEqual(store.remaining, -500)
    }
}
