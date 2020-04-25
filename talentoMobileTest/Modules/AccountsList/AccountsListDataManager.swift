//
//  AccountsListDataManager.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

class AccountsListDataManager {
    let JSONString = """
    {
       "failedAccountTypes":"CREDITCARDS",
       "returnCode":"OK",
       "accounts":[
          {
             "accountBalanceInCents":985000,
             "accountCurrency":"EUR",
             "accountId":748757694,
             "accountName":"Hr P L G N StellingTD",
             "accountNumber":748757694,
             "accountType":"PAYMENT",
             "alias":"",
             "isVisible":true,
             "iban":"NL23INGB0748757694"
          },
          {
             "accountBalanceInCents":1000000,
             "accountCurrency":"EUR",
             "accountId":700000027559,
             "accountName":",",
             "accountNumber":748757732,
             "accountType":"PAYMENT",
             "alias":"",
             "isVisible":false,
             "iban":"NL88INGB0748757732"
          },
          {
             "accountBalanceInCents":15000,
             "accountCurrency":"EUR",
             "accountId":700000027559,
             "accountName":"",
             "accountNumber":"H 177-27066",
             "accountType":"SAVING",
             "alias":"G\\UfffdLSAVINGSdiacrits",
             "iban":"",
             "isVisible":true,
             "linkedAccountId":748757694,
             "productName":"Oranje Spaarrekening",
             "productType":1000,
             "savingsTargetReached":1,
             "targetAmountInCents":2000
          }
       ]
    }
    """
}
