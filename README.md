 
<div align="center">

# ⌚ PocketPay

### Your budget, right on your wrist.

**A lightweight watchOS budgeting app built with SwiftUI.**

Track your expenses, manage your budget, and stay on top of your spending, all from your Apple Watch.

![Swift](https://img.shields.io/badge/Swift-FA7343?style=flat-square&logo=swift&logoColor=white)
![watchOS](https://img.shields.io/badge/watchOS-000000?style=flat-square&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=flat-square&logo=xcode&logoColor=white)
![XCTest](https://img.shields.io/badge/XCTest-34C759?style=flat-square&logo=apple&logoColor=white)

</div>

---

## ✨ Overview

PocketPay is a simple budgeting app designed specifically for the Apple Watch.

I built PocketPay to explore Swift, SwiftUI, watchOS development, and Apple's XCTest framework. The goal was to build something small but practical while getting hands-on experience with UI automation and software testing.

PocketPay makes tracking everyday purchases quick and easy, without needing to pull out your phone.

## 🎬 Demo

**See PocketPay in action!**

▶️ [Watch the PocketPay Demo](



)

*The demo shows how users can select an expense category, enter an amount using the Digital Crown, and track their remaining budget.*

---

## 🚀 Features

**⌚ Built for Apple Watch**

Designed with SwiftUI for a simple, watch-friendly experience.

**👑 Digital Crown Integration**

Use the Apple Watch's Digital Crown to enter dollar and cent amounts.

**💸 Expense Tracking**

Quickly log purchases across five categories: Food, Transport, Travel, Fun, and Other.

**📊 Visual Budget Tracking**

An animated progress ring shows how much of your monthly budget remains.

**🎨 Dynamic Colors**

The budget ring changes color based on spending, providing visual feedback when approaching or exceeding the budget.

**✅ Expense Confirmation**

A confirmation screen lets users know when an expense has been recorded.

---

## 🧪 Testing & Automation

PocketPay was also built as a hands-on project to explore automated testing using Apple's XCTest and XCUITest frameworks.

### Unit Testing

Tests focus on validating the application's budget logic, including:

- Adding expenses and updating the remaining balance
- Calculating spending across multiple expenses
- Removing expenses
- Handling invalid expense indexes
- Testing budget calculations and edge cases

### UI Testing

The app includes accessibility identifiers to help automated tests locate and interact with UI elements.

Key identifiers include:

- `addButton`
- `remainingLabel`
- `amountRing`
- `amountLabel`
- `logButton`
- `confirmationLabel`
- `doneButton`

### Testing Concepts

The project also explores:

- Smoke testing
- Regression testing
- Functional testing
- Test isolation
- UI automation
- Assertions and the Arrange–Act–Assert pattern

---

## 🛠 Tech Stack

| Technology | Purpose |
|---|---|
| Swift | Application logic |
| SwiftUI | User interface |
| watchOS | Apple Watch platform |
| XCTest | Unit testing |
| XCUITest | UI automation |
| Xcode | Development and testing |

---

### How it works

1. The user opens PocketPay and sees their remaining budget.
2. They tap the plus button to add an expense.
3. They select an expense category.
4. They use the Digital Crown to enter dollars and cents.
5. PocketPay records the expense and updates the remaining balance.
6. The budget ring adjusts to reflect the new amount.

---
