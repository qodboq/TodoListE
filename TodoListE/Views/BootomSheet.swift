//
//  BootomSheet.swift
//  TodoListE
//
//  Created by Erik Valigurský on 14/06/2024.
//

import SwiftUI

struct BootomSheet: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss //dismiss sheet
    @State private var showBottomSheet = false
    @State private var text = "Welcome text"
    @FocusState var focusedKeyboard: Bool
    @State private var textFieldText = ""
    @State private var alertTitle = ""
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
            List {
                TextField("Type something here...", text: $textFieldText)
                    .frame(height: 50)
                    .textFieldStyle(.roundedBorder)
                    .clipShape(.rect(cornerRadius: 10))
                    .focused($focusedKeyboard)
                
                Button {
                    print("Tap")
                    saveButtonPressed()
                    dismiss()
                   
                } label: {
                    HStack(spacing: 50) {
                        
                        //                            Image(systemName: "globe")
                        //                            Spacer()
                        Text("Add task")
                            .frame(maxWidth: .infinity)
                            .tint(.white)
                    }
                    .frame(height: 40)
                    .background(Color.accentColor)
                    .clipShape(.rect(cornerRadius: 10))
                    .alert("Alert!", isPresented: $showAlert, actions: {}, message: {Text(alertTitle)})
                }
            }
        }
        .onAppear() {
            focusedKeyboard = true
        }
    }
    func saveButtonPressed() {
        if textIsAppropirate() {
            listViewModel.addItem(title: textFieldText)
            textFieldText = ""
            showBottomSheet.toggle()
        }
    }
    func textIsAppropirate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "You did not type anything"
            showAlert.toggle()
            return false
        }
        return true
    }
}



#Preview {
    NavigationStack {
        BootomSheet()
            .environmentObject(ListViewModel())
    }
   
}
