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
    @IBOutlet weak var toggleVisibilityButton: UIButton!
    @IBOutlet weak var toggleVisibilityButtonImageView: UIImageView!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter.delegate = self
        presenter.getAccounts()
        toggleVisibilityButton.addTarget(self, action: #selector(updateVisibilityValue), for: .touchUpInside)
    }
    
    // MARK: Properties
    
    private let presenter = AccountsListPresenter()
    private var accountsList: [Account] = []
    private var visibleAccountData: [Account] = [] {
        didSet {
            accountsTableView.reloadData()
        }
    }
    private var enableFullListVisibility = false {
        didSet {
            triggerListVisibility()
        }
    }
    
    // MARK: Methods
    
    private func configureTableView() {
        accountsTableView.delegate = self
        accountsTableView.dataSource = self
        accountsTableView.register(AccountItemCell.nib, forCellReuseIdentifier: AccountItemCell.identifier)
    }
    
    @objc private func updateVisibilityValue() {
        enableFullListVisibility = !enableFullListVisibility
    }
    
    private func triggerListVisibility() {
        visibleAccountData = enableFullListVisibility ? accountsList : accountsList.filter({ $0.isVisible == true })
        toggleVisibilityButtonImageView?.image = enableFullListVisibility ? UIImage(named: "eye_slash_fill") : UIImage(named: "eye_fill")
    }

}

// MARK: TableView Delegate Methods

extension AccountsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleAccountData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let customCell = accountsTableView.dequeueReusableCell(withIdentifier: AccountItemCell.identifier, for: indexPath) as? AccountItemCell else { return cell }
        customCell.model = visibleAccountData[indexPath.row]
        cell = customCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114.0
    }
}

// MARK: Presenter Methods

extension AccountsListViewController: AccountsListDelegate {
    func updateListWith(data: AccountListResponse) {
        accountsList = data.accounts
        triggerListVisibility()
    }
}
