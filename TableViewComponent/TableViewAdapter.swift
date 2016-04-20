//
//  TableViewAdapter.swift
//  LeftOrRight
//
//  Created by admin on 05/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class TableViewAdapter: NSObject, UITableViewDataSource {
  
  private weak var _model: TableViewModelProtocol!
  private var _cellType: TableViewCellBase.Type
  private var _selectedAtRowCallback: ((Int)->Void)?
  private weak var _tableView: TableViewBase?
  
  init(tableView:TableViewBase, cellType: TableViewCellBase.Type, model:TableViewModelProtocol) {
    _cellType = cellType
    _model = model
    _tableView = tableView
    super.init()
    initTableView(tableView, cellType: cellType)
  }
  
  private func initTableView(tableView:UITableView, cellType: TableViewCellBase.Type) {
    tableView.delegate = self
    tableView.dataSource = self
    let nib = UINib(nibName: cellType.getNibName(), bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: cellType.getIdForReuse())
  }
 
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let numOfRows = _model.getNumOfRows()
    return numOfRows
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell = tableView.cellForRowAtIndexPath(indexPath) as? TableViewCellBase
    if cell == nil {
      cell = tableView.dequeueReusableCellWithIdentifier(_cellType.getIdForReuse(), forIndexPath: indexPath) as? TableViewCellBase
      let cellData = _model.getDataForCellAtIndex(indexPath.row)
      cell!.renderCellWith(cellData, index: indexPath.row, total: _model.getNumOfRows())
    }
    
    
    return cell!
  }
}


extension TableViewAdapter: UITableViewDelegate {
  
  func setSelectedCallback(callback:(Int)->Void) {
    _selectedAtRowCallback = callback
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if let selectedCallback = _selectedAtRowCallback {
      selectedCallback(indexPath.row)
    }
  }
}


extension TableViewAdapter {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return _tableView?.getCellHeightForRow(indexPath.row) ?? 0
  }
}


extension TableViewAdapter {
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    if let tableView = _tableView as? TableViewScrollEventProtocol {
      tableView.scrollViewDidScroll()
    }
  }
}
