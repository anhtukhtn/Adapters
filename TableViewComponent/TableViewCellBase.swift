//
//  TableViewCellBase.swift
//  LeftOrRight
//
//  Created by admin on 05/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class TableViewCellBase: UITableViewCell {
  func renderCellWith(data:AnyObject, index:Int, total:Int) {
    Assertion.fail("\(self)", funcName: __FUNCTION__, message: DebugString.HAVE_TO_OVERRIDE)
  }
  static func registerForTableView(tableView: UITableView) {
    let nib = UINib(nibName: self.getNibName(), bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: self.getIdForReuse())
  }
}

extension TableViewCellBase: TableViewCellReuseProtocol {
    class func getNibName() -> String {
    Assertion.fail("\(self)", funcName: __FUNCTION__, message: DebugString.HAVE_TO_OVERRIDE)
    return ""
  }
  class func getIdForReuse() -> String {
    Assertion.fail("\(self)", funcName: __FUNCTION__, message: DebugString.HAVE_TO_OVERRIDE)
    return ""
  }
}
