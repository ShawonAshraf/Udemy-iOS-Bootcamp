//
//  ViewController.swift
//  Todoey
//
//  Created by Shawon Ashraf on 8/1/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray: [Item] = [Item]()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Watch Sword Gai again"
        newItem.done = false
        itemArray.append(newItem)
        
        let anotherNewItem = Item()
        anotherNewItem.title = "Stay away from facebook"
        anotherNewItem.done = false
        itemArray.append(anotherNewItem)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        } else {
            print("No default storage data found.")
        }
        
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
                let newItem = Item()
                newItem.title = text

                self.itemArray.append(newItem)
                
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                
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
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
    
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

