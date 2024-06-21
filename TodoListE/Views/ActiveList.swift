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
        VStack {
            List {
                Section {} header: {
                    Text("Active")
                }.padding(.bottom, -10)
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
            .scrollContentBackground(.hidden)
            .navigationTitle("Todo List")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ActiveList()
        .environmentObject(ListViewModel())
}
