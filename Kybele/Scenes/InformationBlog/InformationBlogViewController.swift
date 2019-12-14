//
//  InformationBlogViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class InformationBlogViewController: UIViewController {

    // MARK: - Properties
    private lazy var viewSource: InformationBlogView = {
        let view = InformationBlogView()
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        return view
    }()

    private let viewModel: InformationBlogViewModel

    // MARK: - Initialization
    init() {
        viewModel = InformationBlogViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = viewSource
        title = viewModel.pageTitle
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension InformationBlogViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InformationBlogCell.identifier, for: indexPath) as! InformationBlogCell
        let item = viewModel.items[indexPath.item]
        cell.configure(with: item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        let cellWidth = (width - (Sizes.appSideMargin * 2))
        return CGSize(width: cellWidth, height: 285)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: Sizes.appSideMargin, bottom: 8, right: Sizes.appSideMargin)
    }
}
