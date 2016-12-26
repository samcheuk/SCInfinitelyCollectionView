//
//  ExampleCollectionViewCell.swift
//  SCInfinitelyCollectionView
//
//  Created by sam on 24/12/2016.
//  Copyright © 2016 samcheuk. All rights reserved.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(value: String) {
        titleLabel.text = value
    }
}
