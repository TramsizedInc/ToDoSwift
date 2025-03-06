//
//  AddReminder.swift
//  CsabaToDO2
//
//  Created by iOS Student on 06/03/2025.
//

import SwiftUI

struct AddReminderView: View {
  enum FocusableField: Hashable {
    case title
  }

  @FocusState
  private var focusedField: FocusableField?

  @Binding var reminder: Reminder

  @Environment(\.dismiss)
  private var dismiss

    let priorityOptions = ["Low", "Medium", "High", "Zsofi"]
    @State private var selectedPriorityOption = "Low"
    
  var onCommit: (_ reminder: Reminder) -> Void

  private func commit() {
    onCommit(reminder)
    dismiss()
  }

  private func cancel() {
    dismiss()
  }
    
  var body: some View {
    NavigationStack {
      Form {
          Section("Data"){
              TextField("Title", text: $reminder.title)
                .focused($focusedField, equals: .title)
          }
          Section("Priority"){
              Picker("Priority options", selection: $reminder.priority){
                  ForEach(priorityOptions, id: \.self){option in
                      Text(option)
                  }
                  
              }.pickerStyle(MenuPickerStyle())
                  .onChange(of: reminder.priority) { oldValue, newValue in
                      print(oldValue)
                      print(newValue)
                  }
                  
          }
      }
      .navigationTitle("New Reminder")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(action: cancel) {
            Text("Cancel")
          }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button(action: commit) {
            Text("Add")
          }
          .disabled(reminder.title.isEmpty)
        }
      }
      .onAppear {
        focusedField = .title
      }
    }
  }
}
