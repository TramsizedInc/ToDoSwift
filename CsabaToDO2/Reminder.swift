//
//  Reminder.swift
//  CsabaToDO2
//
//  Created by iOS Student on 06/03/2025.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
    var priority: String
}

extension Reminder {
    static let samples = [
        Reminder(title: "Fuel car", isCompleted: true, priority: "low"),
        Reminder(title: "Buy flowers", priority: "Zsofi")
    ]
}
