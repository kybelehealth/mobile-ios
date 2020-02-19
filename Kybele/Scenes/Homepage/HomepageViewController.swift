//
//  HomepageViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {

    var interactor: HomepageInteractor!
    
    private var items: [HomepageInteractor.Item] = []
    
    private lazy var viewSource: HomepageView = {
        let view = HomepageView()
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        return view
    }()

    override func loadView() {
        view = viewSource
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [viewSource.rightBarButtonItem]
        navigationItem.leftBarButtonItem = viewSource.leftBarButtonItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "KYBELE"
        prepareContent()
    }
}

extension HomepageViewController {
    
    private func prepareContent() {
        interactor.start().done { [weak self] items in
            self?.items = items
            self?.viewSource.collectionView.reloadData()
        }
        .cauterize()
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension HomepageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomepageCell.identifier, for: indexPath) as! HomepageCell
        let item = items[indexPath.item]
        cell.populate(with: item)
        return  cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        let vc = item.destination
        interactor.coordinator.show(destination: vc)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        let cellWidth = (width - (Sizes.appSideMargin * 2) - Sizes.homepageInteritemSpace)/2
        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: Sizes.appSideMargin, bottom: 8, right: Sizes.appSideMargin)
    }
}
