//
//  ViewController.swift
//  realmSwift
//
//  Created by RK on 06/11/24.
//

import UIKit
import RealmSwift
class ViewController: UIViewController
{
    let realm = try! Realm()
    var items: Results<TodoItem>?
    var enteredTask: String?
    var todoListArray = [String]()
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var addTodoButon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromRealm()
        print(realm.configuration.fileURL as Any)
        // Do any additional setup after loading the view.
    }
    @IBAction private func addTodoButtonTapped()
    {
        let addToDoAlert = UIAlertController(title: "New Task", message: "Enter the todo task", preferredStyle: .alert)
        addToDoAlert.addTextField { textfield in
            textfield.placeholder = "Enter the Task"
        }
        let addTodoAction = UIAlertAction(title: "Add", style: .default) { [self] action in
            if let textfield = addToDoAlert.textFields?.first
            {
                let newTodoItem = TodoItem.addTodo(tittle: textfield.text!)
                print("Write to Realm")
                try! realm.write
                {
                    print("Entered task :\(textfield.text!)")
                    realm.add(newTodoItem)
                    todoTableView.reloadData()
                }
            }
        }
        addToDoAlert.addAction(addTodoAction)
        addToDoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(addToDoAlert, animated: true)
    }
    
}
extension ViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "toDoListTableViewCell", for: indexPath) as! toDoListTableViewCell
        if let data = items?[indexPath.row]
        {
            todoCell.toDoListLabel.text = data.title
        }
        todoCell.deleteTodoButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        return todoCell
    }
    
    
    
}
extension ViewController
{
    
    @objc private func deleteButtonTapped(_ sender: UIButton)
    {
//        let selectedIndex = sender.tag+1
        deleteDataFromRealm(at: sender.tag)
        
    }
    private func getDataFromRealm()
    {
        items = realm.objects(TodoItem.self)
        todoTableView.reloadData()
    }
    private func deleteDataFromRealm(at index: Int)
    {
        let items = realm.objects(TodoItem.self)
        
        // Adjust the index by adding 1 to account for Realm's 1-based indexing assumption
        let adjustedIndex = index + 1
        
        // Ensure the adjusted index is within the bounds of the items
        if adjustedIndex < items.count {
            let deleteItem = items[adjustedIndex] // Retrieve the item at the adjusted index
            try! realm.write {
                realm.delete(deleteItem) // Delete the item from Realm
            }
        }
        todoTableView.reloadData()
    }
    
    
}
