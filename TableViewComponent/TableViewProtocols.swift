//
//  TableViewProtocols.swift
//  LeftOrRight
//
//  Created by mac on 3/22/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import Foundation

protocol TableViewModelProtocol: class {
  func getNumOfRows() -> Int
  func getDataForCellAtIndex(index:Int) -> AnyObject
}

protocol TableViewCellReuseProtocol: class {
  static func getNibName() -> String
  static func getIdForReuse() -> String
}

protocol TableViewScrollEventProtocol {
  func scrollViewDidScroll()
}