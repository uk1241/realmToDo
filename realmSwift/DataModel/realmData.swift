//
//  realmData.swift
//  realmSwift
//
//  Created by RK on 06/11/24.
//

import Foundation
import RealmSwift
import UIKit

class realmData: Object
{
    
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var proffession: String = ""
    @objc dynamic var place : String = ""
    
    
}

class TodoItem: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var isCompleted = false
    @objc dynamic var createdAt = Date()

    override static func primaryKey() -> String? {
        return "id"
    }
    static func addTodo(tittle:String) -> TodoItem
    {
        let todoitem = TodoItem()
        todoitem.title = tittle
        return todoitem
    }
}
