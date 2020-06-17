//
//  AssetDetailCoordinator.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/14.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation
import Photos

protocol AssetDetailCoordinator: Coordinator {
    func startAssetDetailViewController(asset: PHAsset)
}

extension MainCoordinator: AssetDetailCoordinator {
    func startAssetDetailViewController(asset: PHAsset) {
        let viewController = AssetDetailViewController.instantiate()
        viewController.coordinator = self
        viewController.asset = asset
        navigationController.pushViewController(viewController, animated: true)
    }
}
