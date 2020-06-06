//
//  CollectionViewFlowLayout.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/03.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

protocol CollectionViewDelegate: class {
    func numberOfItems() -> Int
}

class StatusCollectionViewFlowLayout: UICollectionViewFlowLayout {
    private let numberOfColumns = 3
    private let cellPadding: CGFloat = 20 // could reduce to i6
    private let cellHeight: CGFloat = 150
    weak var delegate: CollectionViewDelegate?
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0
    private var imageHeight: CGFloat = 150
    private var numberOfLines: CGFloat = 0
    
    
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return .zero }
        
        let contentWidth = collectionView.bounds.size.width
        
        let contentHeight =  collectionView.bounds.size.height
        
        // this enables the scrolling
        
        return CGSize(width: contentWidth, height: 1000)
    }
    
    // could prepare
    
    // we can calculate the cell size here!!!
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: contentWidth, height: contentHeight)
//    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        for attribute in attributes {
            guard let attr = layoutAttributesForItem(at: attribute.indexPath) else { return nil }
            visibleLayoutAttributes.append(attr)
        }
        return visibleLayoutAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        guard let collectionView = collectionView else { return nil }
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        guard let cell = collectionView.cellForItem(at: indexPath) as? StatusCollectionViewCell else { return nil }
        attributes.frame = frameFor(statusCell: cell, collectionView: collectionView)
        
        return attributes
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        if collectionView?.bounds != newBounds {
            return true
        }
        return false
    }
    
    private func frameFor(statusCell: StatusCollectionViewCell, collectionView: UICollectionView) -> CGRect {
        
        let cellWidth = collectionView.bounds.size.width
        let textBoxHeight = statusCell.statusText.bounds.height
        let nameLabelHeight = statusCell.userName.bounds.height
        let imageHeight: CGFloat = statusCell.statusImage.image == nil ? 0 : self.imageHeight
        
        let cellHeight = (cellPadding * 2) + imageHeight + textBoxHeight + nameLabelHeight
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        var frame: CGRect = .zero
        let indexPath = collectionView.indexPath(for: statusCell)
        frame.origin.y = cellHeight * CGFloat((indexPath!.item))

        frame = CGRect(origin: frame.origin, size: size)
        return frame
    }
    
    // preferredLayoutAttributesFitting and estimatedSize
    
}

//if attribute.frame.intersects(rect) {
//    visibleLayoutAttributes.append(attribute)
//}
