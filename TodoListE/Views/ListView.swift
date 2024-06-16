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
//    @Environment(\.dismiss) var dismiss //dismiss sheet
    @State private var showSheet = false
    private let textFieldColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1) // colorLiterall()
    var body: some View {
        NavigationStack {
            ZStack {
                if listViewMode.items.isEmpty {
                    Text("YaY Everything is Done")
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
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack() {
                        Spacer()
                        Button ("Add"){
                            showSheet.toggle()
                        }
                        .clipShape(Circle())
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }.sheet(isPresented: $showSheet, content: {
                        BootomSheet() })// TOTO SPOSOBUJE PROBLEM TREBA DORIESIT asi
                }
            }
        }.navigationTitle("Todo List")
            .toolbar() {
                EditButton()
        }
    }
}


#Preview {
    NavigationStack {
        ListView()
            .environmentObject(ListViewModel())
    }
    
}
