//
//  FeedDetailViewModel.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/19.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

struct FeedDetailViewModel {
    let comments: [DetailCommentViewModel]
    
}

struct DetailCommentViewModel {
    let userName: String
    let timeStamp: String
    let comment: String 
}
