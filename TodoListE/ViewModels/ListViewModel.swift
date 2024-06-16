//
//  ListViewModel.swift
//  TodoListE
//
//  Created by Erik Valigurský on 08/06/2024.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 C - create
 R - read
 U - update
 D - delete
 
 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            savedItems()
        }
    }
    let itemsKey: String = "items_list"
    init() {
        getItems()
    }
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey), 
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    func savedItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodeData, forKey: itemsKey)
        }
    }
}
    

