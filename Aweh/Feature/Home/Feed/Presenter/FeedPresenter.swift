//
//  FeedPresenterImplemantation.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/03.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol FeedPresenter {
    var statusCount: Int { get }
    
    func getStatuses(status: @escaping (_ status: [StatusViewModel]) -> Void)
    func getStatus(at index: IndexPath) -> StatusViewModel
    
    var feedCellPresenter: FeedCellPresenter { get }
    
    func index(for item: StatusViewModel) -> Int

}

protocol StoriesPresenter {
    
}

class FeedPresenterImplemantation {
    
    var feedCellPresenter: FeedCellPresenter = FeedCellPresenter()
    
//    should have a init with status object
    
}

extension FeedPresenterImplemantation: FeedPresenter {
    func index(for item: StatusViewModel) -> Int {
        Self.mockStatus().firstIndex {
            item == $0
       } ?? 0
    }
    
    func getStatus(at index: IndexPath) -> StatusViewModel {
        Self.mockStatus()[index.item]
    }
    
    var statusCount: Int {
        Self.mockStatus().count
    }
    
    func getStatuses(status: @escaping (_ status: [StatusViewModel]) -> Void) {
        status(FeedPresenterImplemantation.mockStatus())
    }
    
    static func status() -> [Status] {
        return [
            Status(status: "Some status this is a long status messageg that will span more rhtsdsdsdhshd df",
                   userName: "Divine",
                   statusImageLink: "1",
                   userImageLink: "2",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status ",
                   userName: "Divine",
                   statusImageLink: "1",
                   userImageLink: "3",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "1",
                   userImageLink: "2",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "2",
                   userImageLink: "3",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
            Status(status: "Some status",
                   userName: "Divine",
                   statusImageLink: "1",
                   userImageLink: "2",
                   timeSincePosted: Date(),
                   distanceFromYou: 30),
        ]
    }
    
    static func mockStatus() -> [StatusViewModel] {
        FeedPresenterImplemantation.status().map(StatusViewModel.transform(from:))
    }
}
