//
//  StatusViewController.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/23.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

class StatusPageViewController: UIPageViewController {
    
    weak var coordinator: StatusCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bar = navigationController!.navigationBar
        bar.backgroundColor = .cyan
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bar = navigationController!.navigationBar
        bar.frame.size.height += 14
    }
}
