//
//  ListTableViewController.swift
//  Restaurant
//
//  Created by Thierry Tran on 10/03/2015.
//  Copyright (c) 2015 Thierry Tran. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController {

    var listeLieu : Array<AnyObject>=[]
    
   // @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Lieu")
        
        listeLieu = try! context.executeFetchRequest(freq)
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listeLieu.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let lieu: NSManagedObject = listeLieu[indexPath.row] as! NSManagedObject
        
        
        cell.textLabel?.text=lieu.valueForKey("nom") as! String?
        
        let adresse = lieu.valueForKey("adresse") as! String?
        let type = lieu.valueForKey("type") as! String?
        
        cell.detailTextLabel?.text = "\(adresse) - Type : \(type)"
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Référence à notre contexte
        let context : NSManagedObjectContext = appDel.managedObjectContext!
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
                context.deleteObject(listeLieu[indexPath.row] as! NSManagedObject)
                listeLieu.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
        
        var error: NSError? = nil
        do {
            try context.save()
        } catch var error1 as NSError {
            error = error1
           abort()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "lieuDetail"{
            /*let row = self.tableView.indexPathsForSelectedRows()!.row
            var selectLieu : NSManagedObject = listeLieu[row!] as NSManagedObject
            let vc : DetailsViewController = segue.destinationViewController as DetailsViewController
            vc.nom = selectLieu.valueForKey("nom") as String
            vc.adresse = selectLieu.valueForKey("adresse") as String
            vc.note = selectLieu.valueForKey("note") as Float
            vc.type = selectLieu.valueForKey("type") as String
            vc.commentaire = selectLieu.valueForKey("commentaire") as String
            vc.existLieu=selectLieu*/
        }
    }
    

}
