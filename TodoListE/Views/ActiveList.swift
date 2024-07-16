//
//  ActiveList.swift
//  TodoListE
//
//  Created by Erik Valigurský on 21/06/2024.
//

import SwiftUI

struct ActiveList: View {
    @EnvironmentObject var listViewMode: ListViewModel
    var body: some View {

            List {
                Section (header: Text("Active")) {
                    ForEach(listViewMode.items) {item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.interactiveSpring) {
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
            .navigationTitle("Todo List")
//            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ActiveList()
        .environmentObject(ListViewModel())
}
// Can HELP !!!!
//ForEach(array) { arr in
//     if arr.show {
//         Text("\(arr.text)")
//     }
//}
