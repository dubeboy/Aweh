//
//  AssetsHorizontalListView.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/13.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit
import Photos

class AssetsHorizontalListView: UIScrollView {
//    let contentView: UIView = UIView()
    let stackView: UIStackView = UIStackView()
 
   init(assets: [String: PHAsset]) {
        super.init(frame: .zero)
        setup(assets: assets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(assets: [String: PHAsset]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let rect = CGRect(x: 0, y: 0, width: 80, height: 100)
        let imageManager = PHImageManager.default()
        for (_, asset) in assets {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(imageView)
            imageView.widthAnchor --> 80
            imageView.heightAnchor --> 100
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .brown
            
        
            imageManager.requestImage(
                for: asset,
                targetSize: rect.size,
                contentMode: .aspectFill,
                options: nil
            ) { image, _ in
                imageView.image = image
            }
        }
        
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 8
        addSubview(stackView)
        stackView --> self
    }
}
