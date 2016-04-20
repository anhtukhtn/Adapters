//
//  CollectionViewProtocols.swift
//  LeftOrRight
//
//  Created by mac on 3/22/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import Foundation

protocol CollectionViewModelProtocol: class {
  func getNumOfRows() -> Int
  func getDataForCellAtItem(item:Int) -> AnyObject
}

protocol CollectionViewCellReuseProtocol: class {
  static func getNibName() -> String
  static func getIdForReuse() -> String
}

protocol CollectionViewScrollEventProtocol {
  func scrollViewDidScroll()
}