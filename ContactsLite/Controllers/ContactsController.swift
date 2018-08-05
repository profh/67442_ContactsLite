//
//  ContactsController.swift
//  ContactsLite
//  Copyright © 2018 Larry Heimann. All rights reserved.
//

import UIKit

class ContactsController: UITableViewController, AddContactControllerDelegate {
  
  
  // MARK: - Properties
  var contacts = [Contact]()
  var dataManager = DataManager()
  let test = "Test"
  
  
  // MARK: - General
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.leftBarButtonItem = self.editButtonItem
    dataManager.loadContacts()
    contacts = dataManager.contacts
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Segues
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let contact = contacts[indexPath.row]
        (segue.destination as! DetailViewController).detailItem = contact
      }
    } else if segue.identifier == "addContact" {
      let navigationController = segue.destination as! UINavigationController
      let controller = navigationController.topViewController as! AddContactController
      //controller.doneBarButton.isEnabled = false
      controller.delegate = self
    }
  }

  // MARK: - Table View
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contacts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
    
    let contact = contacts[indexPath.row]
    cell.textLabel!.text = contact.name
    return cell
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      contacts.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array,
      // and add a new row to the table view. However, not strictly needed here
      // given the segue automatically goes to add contact.
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "showDetail", sender: tableView)
  }

 // MARK: - Delegate protocols
  
  func addContactControllerDidCancel(controller: AddContactController) {
    dismiss(animated: true, completion: nil)
  }
  
  func addContactController(controller: AddContactController, didFinishAddingContact contact: Contact) {
    let newRowIndex = contacts.count
    
    contacts.append(contact)
    
    let indexPath = NSIndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths as [IndexPath], with: .automatic)
    
    dismiss(animated: true, completion: nil)
  }
  
}

