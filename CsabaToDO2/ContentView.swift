//
//  ContentView.swift
//  CsabaToDO2
//
//  Created by iOS Student on 06/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var reminders = Reminder.samples
    @State private var newReminder = Reminder(title: "", priority: "Low")
    @State private var isAddReminderDialogPresented = false
    
    
    private func presentAddReminderView() {
        newReminder = Reminder(title: "", priority: "Low")
        isAddReminderDialogPresented.toggle()
    }
    
    var body: some View {
        List($reminders) { $reminder in
            HStack {
                Image(systemName: reminder.isCompleted
                      ? "largecircle.fill.circle"
                      : "circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .onTapGesture{
                    reminder.isCompleted.toggle()
                }
                Text(reminder.title)
                Spacer()
                Text(reminder.priority)
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: presentAddReminderView) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented) {
            AddReminderView(reminder: $newReminder) { reminder in
                reminders.append(reminder)
            }
        }
    }
}


