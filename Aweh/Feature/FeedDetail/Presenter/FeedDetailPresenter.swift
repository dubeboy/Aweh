//
//  FeedDetailPresenter.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/17.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol FeedDetailPresenter {
    var commentsPresenter: CommentCellPresenter { get }
    var feedDetailCellPresenter: FeedDetailCellPresenter { get }
}

class FeedDetailPresenterImplemantation: FeedDetailPresenter {
    var commentsPresenter: CommentCellPresenter
    var feedDetailPresenter: CommentCellPresenter
    
    init(viewModel: FeedDetailViewModel) {
        
    }
    
}
