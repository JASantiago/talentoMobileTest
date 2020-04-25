//
//  AccountsListPresenter.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

protocol AccountsListDelegate {
    func updateListWith(data: AccountListResponse)
}

class AccountsListPresenter {
    
    // MARK: Properties
    
    var delegate: AccountsListDelegate?
    
    // MARK: Methods
    
    func getAccounts() {
        #warning("TODO: Handle Error")
        guard let accountData = AccountsListDataManager.shared.fetchAccountsData() else { return }
        delegate?.updateListWith(data: accountData)
    }
}
