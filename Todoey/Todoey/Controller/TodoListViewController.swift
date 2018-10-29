//
//  ViewController.swift
//  Todoey
//
//  Created by Shawon Ashraf on 8/1/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var todos: Results<Todo>?
    // create a context for persistance storage
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // category
    var selectedCategory: Category? {
        didSet {
            loadData()
        }
    }
    
    // realm instance
    let realm = try? Realm()
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (_) in
            
            if let text = textField.text {
                do {
                    // save todo
                    try self.realm?.write {
                        let newItem = Todo()
                        newItem.title = text
                        newItem.done = false
                        newItem.dateCreated = Date()
                        self.selectedCategory?.todos.append(newItem)
                    }
                } catch {
                    print("\(error)")
                }
                
                self.tableView.reloadData()
            } else {
                // GG
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        if let todo = todos?[indexPath.row] {
            cell.textLabel?.text = todo.title
            cell.accessoryType = todo.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "Nothing here mate!"
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let todo = todos?[indexPath.row] {
            do {
                try realm?.write {
                    todo.done = !todo.done
                    realm?.delete(todo)
                }
            } catch {
                print("\(error)")
            }
        } else {
            //gg
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // load todos from storage when the app starts
    // sets a default value for fetch if nothing is set
    func loadData() {
        todos = selectedCategory?.todos.sorted(byKeyPath: "title", ascending: true)
        self.tableView.reloadData()
    }
    
}

