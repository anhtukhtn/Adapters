//
//  TableViewBase.swift
//  LeftOrRight
//
//  Created by admin on 05/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class TableViewBase: UITableView {
  
  private var _tableAdapter: TableViewAdapter!
  private var _model: TableViewModelProtocol!
  private var _cellType: TableViewCellBase.Type!
  private var _cellHeight: Int = -1
  
  init(model:TableViewModelProtocol, cellType: TableViewCellBase.Type) {
    super.init(frame: CGRectZero, style: .Plain)
    self.initAdapterForModel(model,cellType: cellType)
  }
  
  init(model:TableViewModelProtocol, cellType: TableViewCellBase.Type, cellHeight:Int) {
    _cellHeight = cellHeight
    super.init(frame: CGRectZero, style: .Plain)
    self.initAdapterForModel(model,cellType: cellType)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func initFor(model:TableViewModelProtocol, cellType: TableViewCellBase.Type) {
    self.initAdapterForModel(model,cellType: cellType)
  }
  
  private func initAdapterForModel(model:TableViewModelProtocol, cellType:TableViewCellBase.Type) {
    _model = model
    _cellType = cellType
    
    _tableAdapter = TableViewAdapter(
      tableView: self,
      cellType: _cellType,
      model:_model)
  }
  
  func getCellHeightForRow(row: Int)->CGFloat {
    if _cellHeight != -1 {
      return CGFloat(_cellHeight)
    }
    return self.frame.height
  }
 
  func scrollToBottom(animated: Bool = true) {
    let sections = self.numberOfSections
    let rows = self.numberOfRowsInSection(sections - 1)
    self.scrollToRowAtIndexPath(NSIndexPath(forRow: rows - 1, inSection: sections - 1), atScrollPosition: .Bottom, animated: true)
  }
}
