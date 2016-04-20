//
//  CollectionViewBase.swift
//  LeftOrRight
//
//  Created by admin on 05/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class CollectionViewBase: UICollectionView {
  
  private var _collectionAdapter: CollectionViewAdapter!
  private var _model: CollectionViewModelProtocol!
  private var _cellType: CollectionViewCellBase.Type!
  private var _cellSize = CGSizeZero
  
  init(
    model:CollectionViewModelProtocol,
    cellType: CollectionViewCellBase.Type)
  {
    super.init(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
    self.initAdapterForModel(model,cellType: cellType)
  }
  
  init(
    model:CollectionViewModelProtocol,
    cellType: CollectionViewCellBase.Type,
    cellSize:CGSize)
  {
    _cellSize = cellSize
    super.init(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
    self.initAdapterForModel(model,cellType: cellType)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func initFor(
    model:CollectionViewModelProtocol,
    cellType: CollectionViewCellBase.Type)
  {
    self.initAdapterForModel(model,cellType: cellType)
  }
  
  func initFor(
    model:CollectionViewModelProtocol,
    cellType: CollectionViewCellBase.Type,
    cellSize:CGSize)
  {
    _cellSize = cellSize
    self.initAdapterForModel(model,cellType: cellType)
  }
  
  private func initAdapterForModel(model:CollectionViewModelProtocol, cellType:CollectionViewCellBase.Type) {
    _model = model
    _cellType = cellType
    
    _collectionAdapter = CollectionViewAdapter(
      collectionView: self,
      cellType: _cellType,
      model:_model)
  }
  
  func getCellSizeForRow(item: Int)-> CGSize {
    if _cellSize != CGSizeZero {
      return _cellSize
    }
    return self.frame.size
  }
  
  func selectedItem(completion:(Int)->Void) {
    _collectionAdapter.setSelectedCallback(completion)
  }
}
