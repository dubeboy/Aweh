//
//  StatusCellPresenter.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/06.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

class StatusCellPresenter {
    func configure(with cell: StatusCollectionViewCell, forDisplaying model: StatusViewModel) {
        cell.userName.text = model.userName
        cell.statusText.text = model.status
        cell.distanceAndTime.text = model.distanceFromYou
        cell.statusImage.image = model.statusImage
    }
}
