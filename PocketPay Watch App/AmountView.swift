//
//  AmountView.swift
//  PocketPay
//
//  Created by Owner on 2026-10-24.
//

import SwiftUI

// the screen where you set how much you spent using the digital crown
struct AmountView: View {
    // the shared notebook, so i can add the expense when i hit log
    @EnvironmentObject var store: BudgetStore

    // the category that got passed in from the last screen
    let category: String
    @Binding var isAddingExpense: Bool

    // this screen's own private state (like useState in react)
    @State private var dollars: Double = 0          // 0 to 200
    @State private var cents: Double = 0            // 0 to 99
    @State private var editingCents = false         // false = dollars mode, true = cents mode
    @State private var showConfirmation = false
    @FocusState private var ringFocused: Bool// flips to true after i log

    // max dollars the crown can go to, keeps the ring from being impossible to fill
    let maxDollars: Double = 2000

    // putting dollars and cents together, like 15 + 0.99 = 15.99
    var totalAmount: Double {
        Double(Int(dollars)) + Double(Int(cents)) / 100
    }

    // how full the ring is, depends on which mode i'm in
    var ringProgress: Double {
        if editingCents {
            return cents / 99
        } else {
            return dollars / maxDollars
        }
    }

    // mint for dollars, peach for cents, so you can tell which mode you're in
    var ringColor: Color {
        if editingCents {
            return Color(red: 1.0, green: 0.75, blue: 0.5)    // soft peach
        } else {
            return Color(red: 0.55, green: 0.9, blue: 0.75)   // soft mint
        }
    }

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                // faint background track
                Circle()
                    .stroke(Color.white.opacity(0.08), lineWidth: 10)

                // the ring that fills as i turn the crown
                Circle()
                    .trim(from: 0, to: ringProgress)
                    .stroke(ringColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 0.15), value: ringProgress)

                // the text in the middle
                VStack(spacing: 2) {
                    Text(editingCents ? "Cents" : "Dollars")
                        .font(.system(.caption2, design: .rounded))
                        .foregroundStyle(ringColor)

                    Text("$\(totalAmount, specifier: "%.2f")")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.medium)
                        // name tag so tests can check the amount
                        .accessibilityIdentifier("amountLabel")

                    Text("tap to switch")
                        .font(.system(size: 10, design: .rounded))
                        .foregroundStyle(.secondary)
                }
            }
            // lets this view receive the digital crown
            .focusable()
            // connects the crown to dollars OR cents depending on the mode
            .digitalCrownRotation(
                editingCents ? $cents : $dollars,
                from: 0,
                through: editingCents ? 99 : maxDollars,
                by: 1,
                sensitivity: .low,
                isContinuous: false,
                isHapticFeedbackEnabled: true
            )
            // tap the ring to switch between dollars and cents
            .onTapGesture {
                editingCents.toggle()
            }
            .onAppear {
                ringFocused = true
            }
            .accessibilityIdentifier("amountRing")

            // saves the expense and goes to the confirmation screen
            Button("Log") {
                store.addExpense(category: category, amount: totalAmount)
                showConfirmation = true
            }
            // can't log $0.00, edge case handled!
            .disabled(totalAmount == 0)
            .accessibilityIdentifier("logButton")
        }
        .navigationTitle(category)
        // when showConfirmation turns true, go to the confirmation screen
        .navigationDestination(isPresented: $showConfirmation) {
            ConfirmationView(isAddingExpense: $isAddingExpense)
        }
    }
}

#Preview {
    NavigationStack {
        AmountView(category: "Food", isAddingExpense: .constant(true))
            .environmentObject(BudgetStore())
    }
}
