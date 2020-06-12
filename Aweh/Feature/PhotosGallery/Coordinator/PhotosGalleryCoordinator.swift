//
//  PhotosGalleryCoordinator.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/12.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol PhotosGalleryCoordinator {
    func startPhotosGalleryViewController()
}

extension MainCoordinator: PhotosGalleryCoordinator {
    func startPhotosGalleryViewController() {
        startViewController(viewController: PhotosCollectionViewController.self)
    }
}
