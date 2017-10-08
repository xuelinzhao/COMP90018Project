//
//  ContactsTableViewController.swift
//  COMP90018Project
//
//  Created by 郭圣聪 on 8/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import os.log

 class ContactsTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var contacts = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        
        // Load the sample data.
        loadSampleContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ContactsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContactsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ContactsTableViewCell.")
        }
        
        // Fetches the appropriate contacts for the data source layout.
        let contact = contacts[indexPath.row]
        
        cell.nameLabel.text = contact.name
        cell.photoImageView.image = contact.photo
        cell.phoneLabel.text = contact.phoneNumber

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        super.prepare(for: segue, sender: sender)

        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new contact.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let contactDetailViewController = segue.destination as? ContactViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            guard let selectedContactCell = sender as? ContactsTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }

            guard let indexPath = tableView.indexPath(for: selectedContactCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }

            let selectedContact = contacts[indexPath.row]
            contactDetailViewController.contact = selectedContact
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
 

    // Mark: Actions
    
    @IBAction func unwindToContactList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ContactViewController, let contact = sourceViewController.contact {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing contact.
                contacts[selectedIndexPath.row] = contact
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new contact.
                let newIndexPath = IndexPath(row: contacts.count, section: 0)
                
                contacts.append(contact)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            // Add a new contact.
            let newIndexPath = IndexPath(row: contacts.count, section: 0)
            contacts.append(contact)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion:nil)
    }
    
    
    //MARK: Private Methods
    
    private func loadSampleContacts() {
        let photo1 = UIImage(named: "Monument")
        let photo2 = UIImage(named: "Monument")
        let photo3 = UIImage(named: "Monument")
//        let photo4 = UIImage(named: "defaultPhoto")
        
        guard let contact1 = Contact(name: "Home", photo: photo1, phoneNumber: "123456789") else {
            fatalError("Unable to instantiate contact1")
        }
        
        guard let contact2 = Contact(name: "Father", photo: photo2, phoneNumber: "987654321") else {
            fatalError("Unable to instantiate contact2")
        }
        
        guard let contact3 = Contact(name: "John", photo: photo3, phoneNumber: "0443 428 828") else {
            fatalError("Unable to instantiate contact3")
        }
        
//        guard let contact4 = Contact(name: "000", photo: photo4, phoneNumber: "000") else {
//            fatalError("Unable to instantiate contact4")
//        }
        
        contacts += [contact1, contact2, contact3]
    }
}
