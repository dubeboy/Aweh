//
//  CollectionViewFlowLayout.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/03.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

class StatusCollectionViewFlowLayout: UICollectionViewFlowLayout {
    private let itemSpacing: CGFloat = 8 // should be a global variable
    private let margin: CGFloat = 16
    private let userImageWidth: CGFloat = 60
    private var imageHeight: CGFloat = 200
    private var estimatedHeight: CGFloat = 150
    private var statusPresenter: StatusPresenter
    
    private var cachedAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    
    init(statusPresenter: StatusPresenter) {
        self.statusPresenter = statusPresenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        sectionInset = UIEdgeInsets(
            top: margin,
            left: margin,
            bottom: margin,
            right: margin
        )
        
        let cvBounds = collectionView.bounds
        let cvWidth = cvBounds.width
        
        minimumLineSpacing = itemSpacing
        sectionInsetReference = .fromSafeArea
        scrollDirection = .vertical
        
        guard cachedAttributes.isEmpty else { return }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        
        for item in 0..<itemsCount {
            let indexPath = IndexPath(item: item, section: 0)
            cachedAttributes[indexPath] = createAttributesForItem(at: indexPath, cellWidth: cvWidth)
        }
    }
  
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return .zero }
        
        return CGSize(width: collectionView.bounds.width, height: 10000)
    }

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
        
        return createAttributesForItem(at: indexPath, cellWidth: collectionView.bounds.width)
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        if collectionView?.bounds != newBounds {
            cachedAttributes.removeAll()
            return true
        }
        return false
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        if context.invalidateDataSourceCounts {
            cachedAttributes.removeAll()
        }
        super.invalidateLayout(with: context)
    }
    
    private func frameFor(statusViewModel: StatusViewModel, cellWidth: CGFloat) -> CGRect {
        
        let statusTextFrameHeight = calculateTextBlockSize(text: statusViewModel.status, cvWidth: cellWidth).height
        let nameLabelHeight: CGFloat = 21
        let imageHeight: CGFloat = statusViewModel.statusImage == nil ? 0 : self.imageHeight
        let cellHeight = (margin * 2) + imageHeight + statusTextFrameHeight + nameLabelHeight
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        let itemIndex = CGFloat(statusPresenter.index(for: statusViewModel))
        let yPos = itemIndex * (size.height + itemSpacing)
        
        let frame = CGRect(x: 0, y: yPos, width: size.width, height: size.height)
        return frame
    }
    
    private func calculateTextBlockSize(text: NSAttributedString, cvWidth: CGFloat) -> CGSize {
        
        let width = cvWidth - userImageWidth - (itemSpacing) - (margin * 2)
        let height = ceil(CGFloat(text.length) / width)
        
        return CGSize(width: width, height: height)
        // boundingRect would be most wanted
    }
    
    
    private func createAttributesForItem(at indexPath: IndexPath, cellWidth: CGFloat) -> UICollectionViewLayoutAttributes {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = frameFor(statusViewModel: statusPresenter.getStatus(at: indexPath), cellWidth: cellWidth)
        return attributes
    }
    
    // preferredLayoutAttributesFitting and estimatedSize
    
}

//if attribute.frame.intersects(rect) {
//    visibleLayoutAttributes.append(attribute)
//}
