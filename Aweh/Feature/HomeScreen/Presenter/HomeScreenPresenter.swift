//
//  HomeScreenPresenter.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/03.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol StatusPresenter {
    func getStatus(status: @escaping (_ status: [StatusViewModel]) -> Void)
}

protocol StoriesPresenter {
    
}

protocol PostStatusPresenter {
    
}

class HomeScreenPresenter {
    
}

extension HomeScreenPresenter: StatusPresenter {
    func getStatus(status: @escaping (_ status: [StatusViewModel]) -> Void) {
        status(HomeScreenPresenter.mockStatus())
    }
    
    static func status() -> [Status] {
        return [
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "local file",
                   userImageLink: "local file",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "local file",
                   userImageLink: "local file",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "local file",
                   userImageLink: "local file",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "local file",
                   userImageLink: "local file",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "local file",
                   userImageLink: "local file",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
        ]
    }
    
    static func mockStatus() -> [StatusViewModel] {
        HomeScreenPresenter.status().map(StatusViewModel.transform(from:))
    }
}
