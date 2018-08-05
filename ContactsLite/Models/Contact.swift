//
//  Contact.swift
//  ContactsLite
//  Copyright © 2018 Larry Heimann. All rights reserved.
//

import Foundation

class Contact: NSObject, NSCoding {

  // MARK: - Properties
  var name: String = "Batman"  // Let's be honest, we all want Batman as a contact
  var email: String?
  var phone: String?
  
  // MARK: - General
  
  override init() {
    super.init()
  }
  
  // MARK: - Encoding
  
  // marking 'required' in case of subclassing, this init will be
  // required of the subclass (not really an issue here b/c not
  // subclassing; more for pedagogical purposes at this point)
  required init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: "Name") as! String
    self.email = aDecoder.decodeObject(forKey: "Email") as? String
    self.phone = aDecoder.decodeObject(forKey: "Phone") as? String
    super.init()
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "Name")
    aCoder.encode(email, forKey: "Email")
    aCoder.encode(phone, forKey: "Phone")
  }
  
//  func encodeWithCoder(aCoder: NSCoder) {
//    aCoder.encode(name, forKey: "Name")
//    aCoder.encode(email, forKey: "Email")
//    aCoder.encode(phone, forKey: "Phone")
//  }
  
}
