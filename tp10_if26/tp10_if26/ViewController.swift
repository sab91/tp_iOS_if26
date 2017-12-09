//
//  ViewController.swift
//  tp10_if26
//
//  Created by Sabri on 05/12/2017.
//  Copyright © 2017 Sabri. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    var database: Connection!
    let usersTable = Table("users")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
            
            
        } catch {
            print(error)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func createTable(_ sender: UIButton) {
        let createTable = self.usersTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email, unique: true)
        }
        
        do {
            try self.database.run(createTable)
            print("Created table")
        } catch {
            print(error)
        }
        //print("create Table")
    }
  
    @IBAction func insertUser(_ sender: UIButton) {
        let alert  = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name"}
        alert.addTextField { (tf) in tf.placeholder = "Email"}
        let action = UIAlertAction(title: "Submit", style: .default) {
            (_)in guard
            let name = alert.textFields?.first?.text,
            let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
            let insertUser = self.usersTable.insert(self.name <- name, self.email <- email)
            
            do {
                try self.database.run(insertUser)
                print("User inserted")
            } catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("insert user")
    }
    
    @IBAction func listUser(_ sender: UIButton) {
        
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.email])")
            }
        } catch {
            print(error)
        }
        //print("list user")
        
    }
    
    @IBAction func updateUser(_ sender: UIButton) {
        let alert  = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name"}
        alert.addTextField { (tf) in tf.placeholder = "Email"}
        let action = UIAlertAction(title: "Submit", style: .default) {
            (_)in guard
                let name = alert.textFields?.first?.text,
                let userId = Int(name),
                let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
            
            let user = self.usersTable.filter(self.id == userId)
            let updateUser = user.update(self.email <- email)
            
            do {
                try self.database.run(updateUser)
                print("User updated")
            } catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("update user")
    }
    
    @IBAction func deleteUser(_ sender: UIButton) {
        let alert  = UIAlertController(title: "Delete User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "ID"}
        let action = UIAlertAction(title: "Submit", style: .default) {
            (_)in guard
                let id = alert.textFields?.first?.text,
                let userId = Int(id)
                else { return }
            print(id)
            
            let user = self.usersTable.filter(self.id == userId)
            let deleteUser = user.delete()
            
            do {
                try self.database.run(deleteUser)
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("delete user")
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

