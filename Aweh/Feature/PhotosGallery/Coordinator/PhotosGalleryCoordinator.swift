//
//  PhotosGalleryCoordinator.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/12.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol PhotosGalleryCoordinator: AnyObject {
    func startPhotosGalleryViewController()
}

extension MainCoordinator: PhotosGalleryCoordinator {
    func startPhotosGalleryViewController() {
        let viewController = PhotosCollectionViewController.instantiate()
//        viewController.modalPresentationStyle = .fullScreen
        viewController.coordinator = self
//        navigationController.present(viewController, animated: true, completion: nil)
        navigationController.pushViewController(viewController, animated: true)
    }
}
