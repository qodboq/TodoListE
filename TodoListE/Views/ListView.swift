//
//  ListView.swift
//  TodoListE
//
//  Created by Erik Valigurský on 03/06/2024.
//

import SwiftUI
// Dark mode sposobuje problemy
struct ListView: View {
    
    @EnvironmentObject var listViewMode: ListViewModel
//    @State var colorScheme: ColorScheme? = nil// changing dark mode
    @State private var activeList = ActiveList()
    @State private var showSheet = false
    var body: some View {
                    NavigationStack {
                        VStack {
                            if listViewMode.items.isEmpty {
                                Text("You Have a Free Day :)")
                            } else {
                                activeList
                            }
                        }
                        .toolbar() {
                               ToolbarItem(placement: .topBarLeading) {
                                  EditButton()
                               }
                            ToolbarItem(placement: .topBarTrailing) {
                                Text("Settings")
                            }
                            ToolbarItem(placement: .bottomBar) {
                                HStack() {
                                    Spacer()
                                    Button {
                                        showSheet.toggle()
                                    } label: {
                                        Image(systemName: "plus")
                                    }
                                    .shadow(color: .gray, radius: 5)
                                    .font(.title)
                                    .padding()
                                }.sheet(isPresented: $showSheet, content: {BootomSheet() })
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        ListView()
            .environmentObject(ListViewModel())
    }
    
}

