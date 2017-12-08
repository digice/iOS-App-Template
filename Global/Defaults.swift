//
//  Defaults.swift
//  <#ProjectName#>
//
//  Created by <#ProjectAuthor#> <<#author@domain.com#>>
//  Copyright © 2017 <#Company#>. All rights reserved.
//

import UIKit

class Defaults {

  /** Object For Key
   *   retrieves data from UserDefaults
   *   unarchives the data into AnyObject
   *   returns Any | nil **/
  class func object(forKey key: String) -> Any? {
    if let data = UserDefaults.standard.object(forKey: key) as? Data {
      if let object = NSKeyedUnarchiver.unarchiveObject(with: data) {
        return object
      } // ./data unarchived
    } // ./data retrieved
    return nil
  } // ./object for key

  /** Set Object For Key
   *   archives the object into Data
   *   sets the object in UserDefaults
   *   synchronizes UserDefaults
   *   returns void **/
  class func set(object: Any, forKey key: String) {
    let data = NSKeyedArchiver.archivedData(withRootObject: object)
    UserDefaults.standard.set(data, forKey: key)
    UserDefaults.standard.synchronize()
  } // set object for key

} // ./Defaults
