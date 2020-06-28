//
//  StatusesPresenter.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/23.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

protocol StatusPresenter {
    var title: String { get }
    func getStatusesFor(
        interest viewModel: InterestViewModel,
        completion: @escaping ([StatusViewModel]) -> Void
    )
}

class StatusPresenterImplemantation: StatusPresenter {
    var title: String { viewModel.interestName }
    let viewModel: InterestViewModel
    
    init(with viewModel: InterestViewModel) {
        self.viewModel = viewModel
    }
    
    func getStatusesFor(interest viewModel: InterestViewModel, completion: @escaping ([StatusViewModel]) -> Void) {
        
    }
}
