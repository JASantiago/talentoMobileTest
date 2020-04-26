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
        presenter.getAccounts(visibility: enableFullListVisibility)
        toggleVisibilityButton.addTarget(self, action: #selector(toggeVisibilityValue), for: .touchUpInside)
    }
    
    // MARK: Properties
    
    private let presenter = AccountsListPresenter()
    private var visibleAccountData: [Account] = []
    private var enableFullListVisibility = false
    private var refreshControl = UIRefreshControl()
    
    // MARK: Methods
    
    private func configureTableView() {
        accountsTableView.delegate = self
        accountsTableView.dataSource = self
        accountsTableView.register(AccountItemCell.nib, forCellReuseIdentifier: AccountItemCell.identifier)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        accountsTableView.refreshControl = refreshControl
    }
    
    @objc func toggeVisibilityValue() {
        presenter.getAccounts(visibility: !enableFullListVisibility)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       presenter.getAccounts(visibility: enableFullListVisibility)
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
    func updateListWith(data: [Account], visibility: Bool) {
        visibleAccountData = data
        accountsTableView.reloadData()
        enableFullListVisibility = visibility
        toggleVisibilityButtonImageView?.image = enableFullListVisibility ? UIImage(named: Constants.imageNames.eyeSlash) : UIImage(named: Constants.imageNames.eyeFill)
        refreshControl.endRefreshing()
    }

}
