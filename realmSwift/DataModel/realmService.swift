//
//  realmService.swift
//  realmSwift
//
//  Created by RK on 06/11/24.
//

import Foundation
import RealmSwift

class RealmService
{
    private let realm = try! Realm()

    func getAllItems() -> Results<TodoItem> {
        return realm.objects(TodoItem.self).sorted(byKeyPath: "createdAt", ascending: true)
    }

    func addItem(_ item: TodoItem) {
        try! realm.write {
            realm.add(item)
        }
    }

    func deleteItem(_ item: TodoItem) {
        try! realm.write {
            realm.delete(item)
        }
    }

    func toggleComplete(for item: TodoItem) {
        try! realm.write {
            item.isCompleted.toggle()
        }
    }
}
