//
//  AccountListResponse.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

struct AccountListResponse: Codable {
    var failedAccountTypes: String
    var returnCode: String
    var accounts: [Account]
}
