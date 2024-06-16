//
//  ItemModel.swift
//  TodoListE
//
//  Created by Erik Valigurský on 04/06/2024.
//

import Foundation


// Immutable struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
// this init is hidden so if you wanna customize it, you need to write it first :)
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}

