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
    var adListViewModel: AdListViewModel!
    let tableView = UITableView()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureFilterButton()
        let client = AdClient()
        adListViewModel = AdListViewModel(adClient: client)
        adListViewModel.configureAdListViewModel()
        closureSetup ()
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    /// configure tableview
    func configureTableView () {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
          tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
          tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
          tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        tableView.register(AdCell.self, forCellReuseIdentifier: "AdCell")
    }
    
    /// configure Filtre button
    func configureFilterButton () {
        let filterButton = UIBarButtonItem(title: "Filtrer", style: .plain, target: self, action: #selector(presentSelectCategoryVC))
        self.navigationItem.rightBarButtonItem  = filterButton
    }
    
    /// Present SelectCategoryViewController
    @objc func presentSelectCategoryVC (){
        coordinator?.presentSelectCategoryVC(categories: adListViewModel.categories, selectedCategory: adListViewModel.selectedCategory)
    }
    /// execute closure to update View with ViwModel
    func closureSetup() {
        adListViewModel.reloadList = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK - UITableView data source

extension AdListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adListViewModel.adsViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
        cell.configureCell(viewModel: adListViewModel.adsViewModel[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showAdDetailsVC(adViewModel: adListViewModel.adsViewModel[indexPath.row])
    }
}
