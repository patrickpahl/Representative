//
//  DetailTableViewController.swift
//  Representative
//
//  Created by Patrick Pahl on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var state: String?                                                  ////
    
    var representatives: [Representative] = []                          ////

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let state = state {
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            RepresentativeController.searchRepsByState(state, completion: { (representatives) in
                self.representatives = representatives
                
                dispatch_async(dispatch_get_main_queue(), { 
                    self.tableView.reloadData()
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                })
            })
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return representatives.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath) as? RepresentativeTableViewCell ?? RepresentativeTableViewCell()
                                                                                                                            ////
        let representative = representatives[indexPath.row]
        
        cell.updateWithRepresentative(representative)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
    if let destinationVC = segue.destinationViewController as? DetailTableViewController,
        let selectedIndex = tableView.indexPathForSelectedRow?.row {
        
        let state = StateController.states[selectedIndex]
        destinationVC.state = state
        }
        
    }
}




//if let destinationViewController = segue.destinationViewController as? StateDetailTableViewController,
//let selectedIndex = tableView.indexPathForSelectedRow?.row {
//    
//    let state = StateController.states[selectedIndex]
//    destinationViewController.state = state
//}
//}

