//
//  category.swift
//  PocketPay
//
//  Created by Owner on 2026-10-24.
//

import SwiftUI

// one category = a name, an icon, and a soft color
// Identifiable again! so the list can tell each row apart

struct Category: Identifiable {
    
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
}

// the screen where you pick what you spent money on
struct CategoryView: View {

    // all my categories in one list
    // icons are SF Symbols, same as the coin and the plus
    @Binding var isAddingExpense: Bool
    
    let categories: [Category] = [
        Category(name: "Food",      icon: "fork.knife",       color: Color(red: 1.0,  green: 0.75, blue: 0.5)),
        Category(name: "Transport", icon: "car.fill",         color: Color(red: 0.55, green: 0.75, blue: 1.0)),
        Category(name: "Travel",    icon: "airplane",         color: Color(red: 0.75, green: 0.65, blue: 1.0)),
        Category(name: "Fun",       icon: "sparkles",         color: Color(red: 1.0,  green: 0.6,  blue: 0.8)),
        Category(name: "Other",     icon: "ellipsis.circle",  color: Color(red: 0.75, green: 0.75, blue: 0.75))
    ]

    var body: some View {
        // List makes a scrollable list, perfect for the digital crown
        List {
            // ForEach loops through my categories and makes one row each
            // basically like categories.map() in react
            ForEach(categories) { category in
                // tapping a row goes to the amount screen
                // and passes along which category i picked
                NavigationLink {
                    AmountView(category: category.name, isAddingExpense: $isAddingExpense)
                } label: {
                    // icon on the left, name on the right
                    HStack {
                        Image(systemName: category.icon)
                            .foregroundStyle(category.color)
                            .frame(width: 24)
                        Text(category.name)
                            .font(.system(.body, design: .rounded))
                    }
                }
                // name tag for tests, like "category_Food"
                .accessibilityIdentifier("category_\(category.name)")
            }
        }
        .navigationTitle("Category")
    }
}

    #Preview {
        NavigationStack {
            CategoryView(isAddingExpense: .constant(true))
        }
    }

