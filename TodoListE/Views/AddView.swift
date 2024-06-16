//
//  AddView.swift
//  TodoListE
//
//  Created by Erik Valigurský on 03/06/2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldText: String = ""
    private let textFieldColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1) // colorLiterall()

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(textFieldColor))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()

          
                Button("Add task") {
                    saveButtonPressed()
                }
                .tint(Color.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
                .alert("Alert!", isPresented: $showAlert, actions: {}, message: {Text(alertTitle)})
            }
        }
        .navigationTitle("Add an item ✍🏻 ")

    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
                dismiss()
        }
        
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "You did not type anything"
            showAlert.toggle()
            return false
            
        }
        return true
    }
    

    
    
}

#Preview {
    AddView()
        .environmentObject(ListViewModel())
}

