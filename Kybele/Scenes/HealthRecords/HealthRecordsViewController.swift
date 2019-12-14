//
//  HealthRecordsViewController.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class HealthRecordsViewController: UITableViewController {

    private let viewModel: HealthRecordsViewModel

    private let newRecordView = NewRecordView()

    override init(style: UITableView.Style) {
        viewModel = HealthRecordsViewModel()
        super.init(style: style)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        title = viewModel.pageTitle

        tableView.addSubview(newRecordView)

        newRecordView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = viewModel.items[indexPath.item]
        cell.textLabel?.text = item
        cell.textLabel?.textColor = .purple
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
