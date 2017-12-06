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
    
    @IBAction func createTable(_ sender: UIButton) {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
            
            
        } catch {
            print(error)
        }
        print("create Table")
    }
  
    @IBAction func insertUser(_ sender: UIButton) {
        let alert  = UIAlertController(title: "Isert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name"}
        alert.addTextField { (tf) in tf.placeholder = "Email"}
        let action = UIAlertAction(title: "Submit", style: .default) {
            (_)in guard
            let name = alert.textFields?.first?.text,
            let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("insert user")
    }
    
    @IBAction func listUser(_ sender: UIButton) {
        print("list user")
    }
    
    @IBAction func updateUser(_ sender: UIButton) {
        let alert  = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "ID"}
        let action = UIAlertAction(title: "Submit", style: .default) {
            (_)in guard
                let id = alert.textFields?.first?.text
                else { return }
            print(id)
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
                let id = alert.textFields?.first?.text
                else { return }
            print(id)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("delete user")
    }
    
    var fileUrl = docu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

