//
//  ViewController.swift
//  Core Data
//
//  Created by Nelson Wu on 2016-06-09.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create the delegate and the context, we use the context to access core data
        // Entities are setup using the core data xcdatamodeld on left bar
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        // Add new user
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
/*
        newUser.setValue("Kagamine Rin", forKey: "username")
        newUser.setValue("password", forKey: "password")
*/
        
        // Try to add to data
        do{
            // Data is permanently stored
            // try context.save()
        } catch {
            print("Error")
        }
        
        // Fetch data. Turn returnsObjectsAsFaults off for actual data.
        let request = NSFetchRequest(entityName: "Users")
        
        // Fetch a specific entry
        request.predicate = NSPredicate(format: "username = %@", "Kagamine Rin")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.executeFetchRequest(request)
            for singleResult in result as! [NSManagedObject] {
                let username = singleResult.valueForKey("username") as? String ?? "Username Error"
                let password = singleResult.valueForKey("password") as? String ?? "Password Error"
                print(username + " " + password)
/*
                // Delete an object
                 context.deleteObject(singleResult)
                
                // Change the value in result
                do{
                    singleResult.setValue("newpassword", forKey: "password")
                    try context.save()
                } catch {
                    print("Cannot update")
                }
 */
                
                
            }
            
            
            
        } catch {
            // If you add another attribute with items already in data you will get an error.
            // To fix delete the app from simulator and run Product>Clean
            print("Fetch failed")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

