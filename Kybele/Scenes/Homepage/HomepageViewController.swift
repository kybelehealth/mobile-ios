//
//  HomepageViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {

    var coordinator: HomepageCoordinator!

    private lazy var viewSource: HomepageView = {
        let view = HomepageView()
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        return view
    }()

    private var viewModel: HomepageViewModel

    init() {
        viewModel = HomepageViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = viewSource
        title = viewModel.pageTitle
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [viewSource.rightBarButtonItem]
        navigationItem.leftBarButtonItem = viewSource.leftBarButtonItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomepageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.navigationItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomepageCell.identifier, for: indexPath) as! HomepageCell
        let item = viewModel.navigationItems[indexPath.item]
        cell.populate(with: item)
        return  cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.navigationItems[indexPath.item]
        let vc = item.destinationController
        self.navigationController?.pushViewController(vc)
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

