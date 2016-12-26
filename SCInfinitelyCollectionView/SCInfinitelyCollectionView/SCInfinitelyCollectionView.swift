//
//  SCInfinitelyCollectionView.swift
//  SCInfinitelyCollectionView
//
//  Created by sam on 24/12/2016.
//  Copyright © 2016 samcheuk. All rights reserved.
//

import UIKit

class SCInfinitelyCollectionView: UICollectionView {
    
    var movingSize = 0
    var movingIndex = 0
    var movingPoint = CGFloat(0)
    
    override func reloadData() {
        super.reloadData()
        movingSize = Int(Double(numberOfItems(inSection: 0)) * 0.1)
        movingPoint = CGFloat(movingSize) / CGFloat(numberOfItems(inSection: 0))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if contentOffset.x == 0.0 {
            // avoid in initialize layout
            return
        } else if contentOffset.x < contentSize.width * 0.1 {
            self.appendCell(index: -movingSize)
        } else if contentOffset.x > contentSize.width * 0.6 {
            self.appendCell(index: movingSize)
        }
    }
    
    func appendCell(index: Int) {
        performBatchUpdates({
            for _ in 0...abs(index) {
                let lastIndexPath = IndexPath(row: self.numberOfItems(inSection: 0) - 1, section: 0)
                let firstIndexPath = IndexPath(row: 0, section: 0)
                if index > 0 {
                    self.moveItem(at: firstIndexPath, to: lastIndexPath)
                } else {
                    self.moveItem(at: lastIndexPath, to: firstIndexPath)
                }
            }
        }) { (finish: Bool) in
            self.reloadData()
        }
        
        for view in subviews {
            view.layer.removeAllAnimations()
        }

        var x = CGFloat(0)
        if index > 0 {
            movingIndex += 1
            x = contentOffset.x - contentSize.width * movingPoint
        } else {
            movingIndex -= 1
            x = contentOffset.x + contentSize.width * movingPoint
        }
        setContentOffset(CGPoint(x: x, y: 0), animated: false)
    }

}
