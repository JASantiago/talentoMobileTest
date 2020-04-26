//
//  AccountsListPresenter.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

protocol AccountsListDelegate {
    func updateListWith(data: [Account], visibility: Bool)
}

class AccountsListPresenter {
    
    // MARK: Properties
    
    var delegate: AccountsListDelegate?
    
    // MARK: Methods
    
    func getAccounts(visibility: Bool) {
        guard let accountData = AccountsListDataManager.shared.fetchAccountsData() else { return }
        delegate?.updateListWith(data: filterVisible(data: accountData.accounts, visibility: visibility), visibility: visibility)
    }
    
    func filterVisible(data: [Account], visibility: Bool) -> [Account] {
         return visibility ? data : data.filter({ $0.isVisible == true })
    }
    
}
