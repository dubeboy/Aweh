//
//  PhotosCollectionViewController.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/10.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation
import UIKit
import Photos

protocol PhotosCollectionViewPresenter {
    var images: PHFetchResult<PHAsset>? { get set }
    func loadImages(for size: CGSize, completion: () -> Void)
    func getImage(at indexPath: IndexPath,
                  targetSize: CGSize,
                  completion: @escaping (_ image: UIImage?) -> Void)
     func imageCount() -> Int 
}

class PhotosCollectionViewPresenterImplemantation: PhotosCollectionViewPresenter {
    var images: PHFetchResult<PHAsset>?// save phAsset
    let manager = PHImageManager.default()
    
    func loadImages(for size: CGSize, completion: () -> Void) {
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "mediaType = %d || mediaType = %d",
                                         PHAssetMediaType.image.rawValue, PHAssetMediaType.video.rawValue)
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        images = PHAsset.fetchAssets(with: options)
        completion()
    }
    
    func getImage(at indexPath: IndexPath,
                              targetSize: CGSize,
                              completion: @escaping (_ image: UIImage?) -> Void) {
        guard let asset = images?.object(at: indexPath.item) else { return }
        
            manager.requestImage(
                for: asset,
                targetSize: targetSize,
                contentMode: .aspectFill,
                options: nil
            ) { image, arg  in
                completion(image)
            }
    }
    
    func imageCount() -> Int {
        return images?.count ?? 0
    }
}
