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
//    @State private var showBottomSheet = false
    @State private var text = "Welcome text"
    @FocusState var focusedKeyboard: Bool
    @State var colorScheme: ColorScheme? = nil
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
                        .listRowSeparator(.hidden)
                        .shadow(color: .gray, radius: 5)
                    Button {
                        saveButtonPressed()
                    } label: {
                        HStack(spacing: 50) {
                            
                            //                            Image(systemName: "globe")
                            //                            Spacer()
                            Text("Add task")
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                        }
                        .frame(height: 35)
                        .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.white).opacity(0.1)
                            )

                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 0.3))
                        .shadow(color: .gray, radius: 5, x: 0.0, y: 0.0)
                        .padding(.bottom, 5)
                        .alert("Alert!", isPresented: $showAlert, actions: {}, message: {Text(alertTitle)})
                    }
                }.scrollContentBackground(.hidden)
                    .shadow(radius: 10)
            
            }
            .onAppear() {
                focusedKeyboard = true
        }.presentationDetents([.medium])
         .presentationCornerRadius(20)
         .presentationDragIndicator(.visible)

    }
    func saveButtonPressed() {
        if textIsAppropirate() {
            listViewModel.addItem(title: textFieldText)
//            textFieldText = ""
            dismiss()
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
//            .environmentObject(ListViewModel())
    }
   
}
