//
//  CollectionViewCellBase.swift
//  LeftOrRight
//
//  Created by admin on 05/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class CollectionViewCellBase: UICollectionViewCell {
  func renderCellWith(data:AnyObject, index:Int, total:Int) {
    Assertion.fail("\(self)", funcName: __FUNCTION__, message: DebugString.HAVE_TO_OVERRIDE)
  }
}

extension CollectionViewCellBase: CollectionViewCellReuseProtocol {
    class func getNibName() -> String {
    Assertion.fail("\(self)", funcName: __FUNCTION__, message: DebugString.HAVE_TO_OVERRIDE)
    return ""
  }
  class func getIdForReuse() -> String {
    Assertion.fail("\(self)", funcName: __FUNCTION__, message: DebugString.HAVE_TO_OVERRIDE)
    return ""
  }
}
