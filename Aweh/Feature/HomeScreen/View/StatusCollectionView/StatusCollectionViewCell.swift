//
//  HomeScreenCollectionViewCell.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/03.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

class StatusCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var distanceAndTime: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusImage.contentMode = .scaleAspectFit
        sizeToFit()
    }
    
    //    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    //
    //    }
    
    private func frameFor(statusViewModel: StatusViewModel, cellWidth: CGFloat) -> CGRect {
        
        let statusTextFrameHeight = calculateTextBlockSize(text: statusViewModel.status, cvWidth: cellWidth).height
        let nameLabelHeight: CGFloat = 21
        let imageHeight: CGFloat = statusViewModel.statusImage == nil ? 0 : self.imageHeight
        let cellHeight = (margin * 2) + imageHeight + statusTextFrameHeight + nameLabelHeight
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        let itemIndex = CGFloat(statusPresenter.index(for: statusViewModel))
        let yPos = itemIndex * (estimatedHeight + itemSpacing)
        
        let frame = CGRect(x: 0, y: yPos, width: size.width, height: estimatedHeight)
        return frame
    }
    
    private func calculateTextBlockSize(text: NSAttributedString, cvWidth: CGFloat) -> CGSize {
        
        let width = cvWidth - userImageWidth - (itemSpacing) - (margin * 2)
        let height = ceil((CGFloat(text.length) * 21)  / width)
        
        return CGSize(width: width, height: height * 21)
        // boundingRect would be most wanted
    }
    
    
}
