//
//  AccountsListViewController.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import UIKit

class AccountsListViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var accountsTableView: UITableView!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter.delegate = self
        presenter.getAccounts()
    }
    
    // MARK: Properties
    
    private let presenter = AccountsListPresenter()
    private var accountsList: [Account] = [] {
        didSet {
            accountsTableView.reloadData()
        }
    }
    
    // MARK: Methods
    
    private func configureTableView() {
        accountsTableView.delegate = self
        accountsTableView.dataSource = self
        accountsTableView.register(AccountItemCell.nib, forCellReuseIdentifier: AccountItemCell.identifier)
    }

}

// MARK: TableView Delegate Methods

extension AccountsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let customCell = accountsTableView.dequeueReusableCell(withIdentifier: AccountItemCell.identifier, for: indexPath) as? AccountItemCell else { return cell }
        customCell.model = accountsList[indexPath.row]
        cell = customCell
        return cell
    }
}

// MARK: Presenter Methods

extension AccountsListViewController: AccountsListDelegate {
    func updateListWith(data: AccountListResponse) {
        accountsList = data.accounts
    }
}
