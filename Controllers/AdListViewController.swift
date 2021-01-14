//
//  AdListViewController.swift
//  LeBonCoin
//
//  Created by Amine on 1/14/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit

class AdListViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    /// configure tableview
    func configureTableView () {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
          tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
          tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
          tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}
