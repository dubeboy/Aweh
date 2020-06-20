//
//  FeedDetailViewController.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/17.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

class FeedDetailViewController: UICollectionViewController {
    
    var presenter: FeedDetailPresenter!
    weak var coordinator: Coordinator!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FeedDetailCollectionViewCell.self)
        collectionView.register(CommentCollectionViewCell.self)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        let width = collectionView.bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
        layout.estimatedItemSize = CGSize(width: width, height: 100)
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.commentsCount + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
            case 0:
            let cell = collectionView.deque(FeedDetailCollectionViewCell.self, at: indexPath)
            presenter.configure(cell)
            return cell
            default:
            let cell = collectionView.deque(CommentCollectionViewCell.self, at: indexPath)
            presenter.configure(cell, for: indexPath)
            return cell
        }
    }
}
