//
//  Account.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

struct Account: Codable {
    var accountBalanceInCents: Int
    var accountCurrency: String
    var accountId: Int
    var accountName: String
    var accountNumber: AccountNumber
    var accountType: String
    var alias: String
    var isVisible: Bool
    var iban: String
    var linkedAccountId: Int?
    var productName: String?
    var productType: Int?
    var savingsTargetReached: Int?
    var targetAmountInCents: Int?
}

enum AccountNumber: Codable {
    
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
           if let x = try? container.decode(String.self) {
               self = .string(x)
               return
           }
           if let x = try? container.decode(Int.self) {
               self = .int(x)
               return
           }
           throw DecodingError.typeMismatch(AccountNumber.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AccountNumber"))
    }
    
    var intValue: Int? {
        switch self {
        case .int(let int):
            return int
        default:
            return nil
        }
    }

    var stringValue: String? {
        switch self {
        case .string(let string):
            return string
        default:
            return nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .int(let x):
            try container.encode(x)
        }
    }
}
