//
//  ModuleTableViewController.swift
//  tp09_if26_exo2
//
//  Created by Sabri on 28/11/2017.
//  Copyright © 2017 Sabri. All rights reserved.
//

import UIKit

class ModuleTableViewController: UITableViewController {
    var cursus: [Module] = []
    var c: Cursus = Cursus()
    var identifiantModuleCellule: String = "celluleModule"
    var categorie: [String] = ["CS", "TM", "ST"]
    var cs: [Module] = []
    var tm: [Module] = []
    var st: [Module] = []
    var tab: [[Module]] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        cursus =  c.getModules()
        tab = [cs, tm, st]
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch categorie[section] {
        case "CS":
            return cs.count
        case "TM":
            return tm.count
        case "ST":
            return st.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // #warning Incomplete implementation, return the number of rows
        return "\(categorie[section])"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiantModuleCellule, for: indexPath)
       
        cell.textLabel?.text = "Sigle \(tab[indexPath.section][indexPath.row].sigle)"
        print(indexPath.section)
        print(indexPath.row)
        //cell.detailTextLabel?.text = "\(tab[indexPath.row].categorie) \(cursus[indexPath.row].resultat) \(cursus[indexPath.row].credit)"
        //return cell
        
        return cell
    }
    
    func remplirTableau() {
        for module in cursus {
            switch module.categorie {
            case "CS":
                cs.append(module)
            case "TM":
                tm.append(module)
            case "ST":
                st.append(module)
            default:
                print("erreur")
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
