//
//  DetailViewController.swift
//  ContactsLite
//  Copyright © 2018 Larry Heimann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  
  
  var detailItem: Contact? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }
  
  func configureView() {
    // Update the user interface for the detail item.
    if let detail: Contact = self.detailItem {
      if let name = self.nameLabel {
        name.text = detail.name
      }
      if let email = self.emailLabel {
        email.text = detail.email
      }
      if let phone = self.phoneLabel {
        phone.text = detail.phone
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
