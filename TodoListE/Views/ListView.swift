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
    @State var colorScheme: ColorScheme? = nil// changing dark mode
    @State private var showSheet = false
    var body: some View {
                    NavigationStack {
                        ZStack {
                            if listViewMode.items.isEmpty {
                                Text("You Have a Free Day :)")
                            } else {
                                List {
                                    ForEach(listViewMode.items) {item in
                                        ListRowView(item: item)
                                            .onTapGesture {
                                                withAnimation(.bouncy) {
                                                    listViewMode.updateItem(item: item)
                                                }
                                            }.listRowSeparator(.hidden)
                                    }
                                    .onDelete(perform: listViewMode.deleteItem)
                                    .onMove(perform: listViewMode.moveItem)
                                }.scrollContentBackground(.hidden)
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
                    }.navigationTitle("Todo List")
    }
}


#Preview {
    NavigationStack {
        ListView()
            .environmentObject(ListViewModel())
    }
    
}

