//
//  AddContactController.swift
//  ContactsLite
//  Copyright © 2018 Larry Heimann. All rights reserved.
//

import UIKit
import Foundation

// MARK: Protocol Methods

protocol AddContactControllerDelegate: class {
  func addContactControllerDidCancel(controller: AddContactController)
  
  func addContactController(controller: AddContactController, didFinishAddingContact contact: Contact)
}


// MARK: - AddContactController

class AddContactController: UITableViewController {
  // MARK: - Outlets
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var phoneField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  
  // MARK: - Properties
  weak var delegate: AddContactControllerDelegate?
  
  
  // MARK: - General
  override func viewDidLoad() {
    super.viewDidLoad()
    // doneBarButton.isEnabled = false
//    if let nameText = nameField.text {
//      doneBarButton.isEnabled = (nameText != "")
//    }

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    nameField.becomeFirstResponder()
//    doneBarButton.isEnabled = false
  }
  
  // MARK: - Actions
  @IBAction func cancel() {
    delegate?.addContactControllerDidCancel(controller: self)
  }
  
  @IBAction func done() {
    let contact = Contact()
    contact.name = nameField.text!
    contact.email = emailField.text
    contact.phone = phoneField.text
    if contact.name.count > 0 {
      delegate?.addContactController(controller: self, didFinishAddingContact: contact)
    }
  }
  
  // MARK: - Table View
  
  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
}
