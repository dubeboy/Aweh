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
        collectionView.registerHeader(FeedDetailCollectionViewCell.self)
        collectionView.register(CommentCollectionViewCell.self)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.commentsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(CommentCollectionViewCell.self, at: indexPath)
        presenter.configure(cell, for: indexPath)
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeHeader(FeedDetailCollectionViewCell.self, at: indexPath)
        presenter.configure(cell)
        return cell
    }
        
   
}

extension FeedDetailViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let size = cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        print("item size: \(size)")
//        
//        return size
//    }
}
