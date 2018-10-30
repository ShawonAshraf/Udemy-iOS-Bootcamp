//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/29/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryTableViewController: SwipeTableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // MARK: - Realm instance
    let realm = try? Realm()
    
    // MARK: - Data vars
    var categories: Results<Category>?
//    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load data from context
        loadData()
        
        // increase cell height
        tableView.rowHeight = 60.0
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 1
    }
    
    // MARK: - swipe view
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        return cell
    }
    
    // MARK: - Table view delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToTodos", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }

    // MARK: - Data manipulation
    
    func saveData(category: Category) {
        do {
            try realm?.write {
                realm?.add(category)
            }
        } catch {
            print("\(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadData() {
        categories = realm?.objects(Category.self)
        
        self.tableView.reloadData()
    }
    
    override func deleteData(at indexPath: IndexPath) {
        if let categoryToBeDeleted = self.categories?[indexPath.row] {
            do {
                try self.realm?.write {
                    self.realm?.delete(categoryToBeDeleted)
                }
            } catch {
                // GG
            }
        }
    }
    
    
    // MARK: - Action handler
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (_) in
            if let text = textField.text {
                let newCategory = Category()
                newCategory.name = text
                
//                self.categories.append(newCategory)
                self.saveData(category: newCategory)
            } else {
                // GG
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}
