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
//    @State private var showBottomSheet = false // obsolete !!!
    @State private var text = "Welcome text"
    @FocusState var focusedKeyboard: Bool
    @State var colorScheme: ColorScheme? = nil // not used right now 
    @State private var textFieldText = ""
    @State private var alertTitle = ""
    @State private var showAlert = false
    var body: some View {
            NavigationStack {
                List {
                    VStack {
                        TextField("Type something here...", text: $textFieldText)
                            .frame(height: 50)
                            .textFieldStyle(.roundedBorder)
                            .clipShape(.rect(cornerRadius: 10))
                            .focused($focusedKeyboard)
                            .listRowSeparator(.hidden)
                            .shadow(color: .gray, radius: 5, x: -1, y: 5)
                        Button {
                            saveButtonPressed()
                        } label: {
                            HStack {
    //                                                        Image(systemName: "globe")
    //                                                        Spacer()
                                Text("Add task")
                                    .frame(maxWidth: .infinity)

 
                            }
                            .alert("Alert!", isPresented: $showAlert, actions: {}, message: {Text(alertTitle)})
                        }
                        .buttonStyle(.borderedProminent).shadow(color: .gray, radius: 5, x: -1, y: 5)
                        .tint(Color.blue)
                        .controlSize(.regular)
                    }.padding(.bottom, 5)
                }
                .scrollContentBackground(.hidden)
                .shadow(radius: 10)
            }
            .onAppear() {
                focusedKeyboard = true
        }
//         .presentationDetents([.medium]) // how high BottomSheet will popUp
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
