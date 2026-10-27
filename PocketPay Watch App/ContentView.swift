//
//  ContentView.swift
//  PocketPay Watch App
//
//  Created by Owner on 2026-10-23.
//

import SwiftUI

struct ContentView: View {
    // grabbing the shared budget store (the notebook) so this screen can read it
    @EnvironmentObject var store: BudgetStore
    // is the add-expense flow open? turning this off closes all those screens at once
    @State private var isAddingExpense = false

    // how much of the budget i've used, from 0.0 to 1.0
    var progress: Double {
        let used = store.totalSpent / store.monthlyBudget
        // capping at 1.0 so it doesn't go past 100% if i go over budget
        return min(used, 1.0)
    }

    // how much of the budget is LEFT, from 1.0 (all of it) to 0.0 (none)
    // the ring shows this so it drains like a battery, matching "Remaining"
    var remainingFraction: Double {
        let left = store.remaining / store.monthlyBudget
        // never below 0, so the ring just disappears if i go over budget
        return max(left, 0)
    }

    // softer colors instead of harsh green/orange/red
    // mint = chilling, peach = careful, coral = over budget
    var ringColor: Color {
        if store.remaining < 0 {
            return Color(red: 1.0, green: 0.55, blue: 0.55)   // soft coral
        } else if progress > 0.8 {
            return Color(red: 1.0, green: 0.75, blue: 0.5)    // soft peach
        } else {
            return Color(red: 0.55, green: 0.9, blue: 0.75)   // soft mint
        }
    }

    var body: some View {
        // NavigationStack lets this screen push to other screens
        // kinda like react router
        NavigationStack {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.08), lineWidth: 12)

                // the ring that drains as i spend, like a battery
                Circle()
                    .trim(from: 0, to: remainingFraction)
                    .stroke(ringColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    // start at the top instead of 3 o'clock
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: remainingFraction)

                VStack(spacing: 6) {
                    // gold coin, just a static icon
                    Image(systemName: "dollarsign.circle.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 1.0, green: 0.85, blue: 0.45))
                        .shadow(color: .yellow.opacity(0.25), radius: 4)

                    Text("Remaining")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundStyle(.secondary)

                    // rounded font + medium weight instead of bold, feels friendlier
                    Text("$\(store.remaining, specifier: "%.2f")")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundStyle(ringColor)
                        // hidden name tag so my UI tests can find this label
                        .accessibilityIdentifier("remainingLabel")

                    Text("of $\(store.monthlyBudget, specifier: "%.0f")")
                        .font(.system(.caption2, design: .rounded))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(4)
            // puts a + button in the top corner of the watch
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    // tapping + turns the switch on, which opens the category screen
                    Button {
                        isAddingExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityIdentifier("addButton")
                }
            }
            .navigationDestination(isPresented: $isAddingExpense) {
                CategoryView(isAddingExpense: $isAddingExpense)
            }
        }
    }
}


// live preview, needs its own store since the app isn't running here
#Preview {
    ContentView()
        .environmentObject(BudgetStore())
}
