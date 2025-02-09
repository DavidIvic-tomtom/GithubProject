//
//  UIHelper.swift
//  GHFollowers
//
//  Created by David on 9.2.25..
//

import UIKit


struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        
        let availableWidth = width - (2 * minimumItemSpacing) - (2 * padding)
        
        let finalWidth = availableWidth/3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: finalWidth, height: finalWidth + 40)
        
        return flowLayout
    }
}
