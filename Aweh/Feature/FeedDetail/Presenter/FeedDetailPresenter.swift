//
//  FeedDetailPresenter.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/17.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol FeedDetailPresenter {
    func configure(_ cell: FeedDetailCollectionViewCell, with viewModel: FeedDetailViewModel)
    func configure(_ cell: CommentCollectionViewCell, for indexPath: IndexPath)
}

class FeedDetailPresenterImplemantation: FeedDetailPresenter {
    let feedDetailCellPresenter: FeedDetailCellPresenter = FeedDetailCellPresenter()
    let commentsPresenter: CommentCellPresenter = CommentCellPresenter()
    
    let viewModel: FeedDetailViewModel
    
    init(statusViewModel: FeedDetailViewModel) {
        self.viewModel = statusViewModel
    }
    
    func configure(_ cell: FeedDetailCollectionViewCell, with viewModel: FeedDetailViewModel) {
        feedDetailCellPresenter.configure(with: cell, forDisplaying: viewModel)
    }
    
    func configure(_ cell: CommentCollectionViewCell, for indexPath: IndexPath) {
        let commentViewModel = viewModel.comments?[indexPath.item]
        guard let viewModel = commentViewModel else { return }
        commentsPresenter.configure(with: cell, forDisplaying: viewModel)
    }
    
}
