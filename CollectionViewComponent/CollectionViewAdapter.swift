//
//  CollectionViewAdapter.swift
//  LeftOrRight
//
//  Created by admin on 05/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class CollectionViewAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  private weak var _model: CollectionViewModelProtocol!
  private var _cellType: CollectionViewCellBase.Type
  private var _selectedAtRowCallback: ((Int)->Void)?
  private weak var _collectionView: CollectionViewBase?
  
  init(collectionView:CollectionViewBase, cellType: CollectionViewCellBase.Type, model:CollectionViewModelProtocol) {
    _cellType = cellType
    _model = model
    _collectionView = collectionView
    super.init()
    initCollectionView(collectionView, cellType: cellType)
  }
  
  private func initCollectionView(collectionView:UICollectionView, cellType: CollectionViewCellBase.Type) {
    collectionView.delegate = self
    collectionView.dataSource = self
    let nib = UINib(nibName: cellType.getNibName(), bundle: nil)
    collectionView.registerNib(nib, forCellWithReuseIdentifier: cellType.getIdForReuse())
  }
 
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let numOfRows = _model.getNumOfRows()
    return numOfRows
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(_cellType.getIdForReuse(), forIndexPath: indexPath) as! CollectionViewCellBase
    cell.layer.shouldRasterize = true
    cell.layer.rasterizationScale = UIScreen.mainScreen().scale
    
    let cellData = _model.getDataForCellAtItem(indexPath.item)
    cell.renderCellWith(cellData, index: indexPath.item, total: _model.getNumOfRows())
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return _collectionView?.getCellSizeForRow(indexPath.item) ?? CGSizeZero
  }
}


extension CollectionViewAdapter: UICollectionViewDelegate {
  
  func setSelectedCallback(callback:(Int)->Void) {
    _selectedAtRowCallback = callback
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    if let selectedCallback = _selectedAtRowCallback {
      selectedCallback(indexPath.item)
    }
  }
}