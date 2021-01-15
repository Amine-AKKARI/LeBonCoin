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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
          tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
          tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
          tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        tableView.register(AdCell.self, forCellReuseIdentifier: "AdCell")
    }
}

// MARK - UITableView data source

extension AdListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
        cell.configureCell()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
