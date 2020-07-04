//
//  HomeScreenViewModel.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/03.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

struct StatusViewModel: Equatable, Hashable {
    // TODO: some sort  of id here to help me get the status withis id from server
    let status: NSAttributedString
    let userName: String
    let statusImage: UIImage? // todo: should be an array!
    let userImage: UIImage
    let timeSincePosted: String
    let distanceFromYou: String
}

extension StatusViewModel {
    static func transform(from status: Status) -> Self {
        
        StatusViewModel(
            status: NSAttributedString(string: status.status), // no need for it attr string 
            userName: status.userName,
            statusImage: status.statusImageLink == nil ? nil : UIImage(named: status.statusImageLink!),
            userImage: UIImage(named: status.userImageLink!)!,
            timeSincePosted: prettifyDate(date: status.timeSincePosted),
            distanceFromYou: String(status.distanceFromYou)
        )
    }
    
    static func prettifyDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        formatter.doesRelativeDateFormatting = true
        
        let locale = Locale.current
        formatter.locale = locale
        
        return formatter.string(from: date)
    }
}
