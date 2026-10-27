//
//  ConfirmationView.swift
//  PocketPay
//
//  Created by Owner on 2026-10-24.
//

import SwiftUI

// shows after you log an expense
struct ConfirmationView: View {
    // the switch from the main screen, done turns it off
    @Binding var isAddingExpense: Bool

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 44))
                .foregroundStyle(Color(red: 0.55, green: 0.9, blue: 0.75))

            Text("Payment logged")
                .font(.system(.body, design: .rounded))
                .accessibilityIdentifier("confirmationLabel")

            // turns the switch off, which closes all the add screens
            // and drops me back on the main screen
            Button {
                isAddingExpense = false
            } label: {
                Text("Done")
                    .font(.system(.footnote, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(width: 70, height: 28)
                    .background(Capsule().fill(Color(red: 0.55, green: 0.9, blue: 0.75)))
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("doneButton")
        }
        // hide the back button so you can't go back and log the same thing twice
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ConfirmationView(isAddingExpense: .constant(true))
}
