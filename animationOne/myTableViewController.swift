//
//  myTableViewController.swift
//  animationOne
//
//  Created by pari on 25/07/17.
//  Copyright © 2017 pari. All rights reserved.
//

import UIKit
import CoreData

class myTableViewController: UITableViewController {

    let vc=ViewController()
    var countValue : Int = 0
    var tempArr = Array<Any>()
    var tempString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        
        print("Value of tempArr _____",tempArr)
        print("_____\n Value of temp String is ",tempString)
        
        save(name: tempString)
    }
    
    func save(name:String){
        var TasksObj : [NSManagedObject] = []
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "Tasks",
                                       in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
         person.setValue(name, forKeyPath: "mydata")
        
        do {
            try managedContext.save()
            TasksObj.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
    }
    
//    func save(){
//        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
//        let context =   appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
//        let manObj = NSManagedObject(entity: entity!, insertInto: context)
//        manObj.setValue(tempArr, forKey: "mydata")
//        do {
//            try context.save()
//        } catch let error as NSError {
//            print("Having an error",error.localizedDescription)
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tempArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text=tempArr[indexPath.row] as? String
        // Configure the cell...
        return cell
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
