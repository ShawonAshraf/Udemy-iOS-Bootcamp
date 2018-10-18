//
//  ViewController.swift
//  Todoey
//
//  Created by Shawon Ashraf on 8/1/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray: [Item] = [Item]()
    // create a context for persistance storage
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
                let newItem = Item(context: self.context)
                newItem.title = text
                newItem.done = false

                self.itemArray.append(newItem)

                self.saveData()
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
        
        self.saveData()

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("\(error)")
        }
        self.tableView.reloadData()
    }
    
    // load todos from storage when the app starts
    func loadData() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            try itemArray = context.fetch(request)
        } catch {
            print("can't fetch")
        }
    }

}

