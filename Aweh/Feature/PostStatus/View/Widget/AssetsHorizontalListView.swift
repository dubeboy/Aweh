//
//  AssetsHorizontalListView.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/13.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit
import Photos

class AssetsHorizontalListView: UIView {
    let scrollView: UIScrollView = UIScrollView()
    let stackView: UIStackView = UIStackView()
    
 
    convenience init(assets: [String: PHAsset]) {
        self.init(frame: .zero)
        setup(assets: assets)
    }
    
    private func setup(assets: [String: PHAsset]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.contentSize = self.bounds.size
        
        self.backgroundColor = UIColor.green // TODO: - debugging
        
        scrollView --> self
        stackView.leadingAnchor --> scrollView.leadingAnchor
        stackView.topAnchor --> scrollView.topAnchor
        stackView.bottomAnchor --> scrollView.bottomAnchor
        
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
    
        let rect = CGRect(x: 0, y: 0, width: 80, height: 100)
        let imageManager = PHImageManager.default()
        for (_, asset) in assets {
            let imageView = UIImageView(frame: rect)
            imageView.widthAnchor --> 80
            imageView.heightAnchor --> 100
            imageView.layer.cornerRadius = 10
            imageView.contentMode = .scaleAspectFill
            
            imageManager.requestImage(
                for: asset,
                targetSize: rect.size,
                contentMode: .aspectFill,
                options: nil
            ) { image, _ in
                imageView.image = image
                self.stackView.addArrangedSubview(imageView)
            }
        }
    }
}
