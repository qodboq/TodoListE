//
//  CompletedList.swift
//  TodoListE
//
//  Created by Erik Valigurský on 21/06/2024.
//

import SwiftUI

struct CompletedList: View {

    @EnvironmentObject var listViewMode: ListViewModel
    var body: some View {
        List {
            Section (header: Text("completed")) {
                ForEach(listViewMode.items) {item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.default) {
                                listViewMode.updateItem(item: item)
                            }
                        }
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: listViewMode.deleteItem)
                .onMove(perform: listViewMode.moveItem)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    CompletedList()
        .environmentObject(ListViewModel())
}
