//
//  AssetsList.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/13.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit
import Photos

class AssetsList: UIView {
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
        
        self.backgroundColor = UIColor.green // TODO: - debugging
        
        scrollView --> self
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        
        scrollView.contentSize = self.bounds.size
        
        scrollView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let rect = CGRect(x: 0, y: 0, width: 80, height: 100)
        let imageManager = PHImageManager.default()
        for (_, asset) in assets {
            let imageView = UIImageView(frame: rect)
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
