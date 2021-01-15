//
//  SelectCategoryViewController.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit

protocol SelectCategoryDelegate: class {
    func didSelectcategory (category: AdCategory)
}

class SelectCategoryViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    weak var delegate: SelectCategoryDelegate?
    let tableView = UITableView()
    var categories = [AdCategory]()
    var selectedCategory: AdCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allCategory = AdCategory(categoryId: 0, categoryName: "Toutes les categories")
        categories.insert(allCategory, at: 0)
        configureNavigationBar()
        configureTableView()
    }
    
    /// Configure Navigation bar
    func configureNavigationBar () {
        self.title = "Filtrer par catégorie"
        configureCancelButton()
        configureValidateButton()
    }
    
    /// Configure left bar button item
    func configureCancelButton () {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTApped))
        self.navigationItem.leftBarButtonItem  = cancelButton
    }
    
    /// Configure right bar button item
    func configureValidateButton () {
        let validateButton = UIBarButtonItem(title: "Valider", style: .plain, target: self, action: #selector(validateButtonTApped))
        self.navigationItem.rightBarButtonItem  = validateButton
    }
    
    /// Configure table view
    func configureTableView () {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
    }
    
    /// Action on cancel button
    @objc func cancelButtonTApped () {
        coordinator?.dismissSelectCategortVC (vc: self)
    }
    
    /// Action on validate button
    @objc func validateButtonTApped () {
        if let selectedCategory = selectedCategory {
            delegate?.didSelectcategory(category: selectedCategory)
            coordinator?.dismissSelectCategortVC (vc: self)
        }
        else {
            coordinator?.dismissSelectCategortVC (vc: self)
        }
    }
}

// MARK: - UITAbleview Data Source
extension SelectCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].categoryName
      return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            selectedCategory = categories[indexPath.row]
        }
    }
}
