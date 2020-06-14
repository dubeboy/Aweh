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
    let contentView: UIView = UIView()
    let stackView: UIStackView = UIStackView()
 
    convenience init(assets: [String: PHAsset]) {
        self.init(frame: .zero)
        self.backgroundColor = UIColor.green // TODO: - debugging
        contentView.backgroundColor = UIColor.red // TODO: - debugging
        setup(assets: assets)
    }
    
    private func setup(assets: [String: PHAsset]) {
        self.addSubview(contentView)
        self.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView --> self
        contentView.centerYAnchor --> centerYAnchor
        contentView.centerXAnchor --> centerXAnchor
        
        contentView.addSubview(stackView)

        stackView.leadingAnchor --> contentView.leadingAnchor
        stackView.topAnchor --> contentView.topAnchor
        stackView.bottomAnchor --> contentView.bottomAnchor
        
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        
//        stackView.setNeedsLayout()
//        stackView.layoutIfNeeded()
//        for i in 0..<10 {
//            let UI
//        }
    
//        let rect = CGRect(x: 0, y: 0, width: 80, height: 100)
//        let imageManager = PHImageManager.default()
//        for (_, asset) in assets {
//
//            let imageView = UIImageView()
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.widthAnchor --> 80
//            imageView.heightAnchor --> 100
//            imageView.layer.cornerRadius = 10
//            imageView.contentMode = .scaleAspectFill
//
//
//            imageManager.requestImage(
//                for: asset,
//                targetSize: rect.size,
//                contentMode: .aspectFill,
//                options: nil
//            ) { image, _ in
//
//                imageView.image = image
//                self.stackView.addArrangedSubview(imageView)
//                self.stackView.setNeedsLayout()
//                self.stackView.layoutIfNeeded()
//                self.layoutIfNeeded()
//            }
//        }
    }
}
