//
//  ViewController.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/02.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let presenter: StatusPresenter = HomeScreenPresenter()
    
    let reuseIdentifier = String(describing: StatusCollectionViewCell.self)

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.collectionViewLayout = StatusCollectionViewFlowLayout()
        
        collectionView.register(
            UINib(nibName: reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: reuseIdentifier
        )
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.statusCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let status = presenter.getStatus(at: indexPath)
        let cell = collectionView.deque(StatusCollectionViewCell.self, at: indexPath)
        presenter.statusCellPresenter.configure(with: cell, forDisplaying: status)
        return cell
    }
}
