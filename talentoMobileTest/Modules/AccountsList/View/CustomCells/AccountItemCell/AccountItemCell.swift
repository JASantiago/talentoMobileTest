//
//  AccountItemCell.swift
//  talentoMobileTest
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import UIKit

class AccountItemCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var ibanLabel: UILabel!
    
    // MARK: Properties
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.init(for: self))
    }
    
    var model: Account? {
        didSet {
            let accountNumberEnumValue = self.model?.accountNumber
            let accountNumber = getAccountNumberFrom(accountNumberEnumValue)
            accountNumberLabel.text = accountNumber
            accountBalanceLabel.text = String(self.model?.accountBalanceInCents ?? 0)
            ibanLabel.text = self.model?.iban
        }
    }

    // MARK: Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Methods
    
    private func getAccountNumberFrom(_ value: AccountNumber?) -> String {
        var stringValue = ""
        
        switch value {
        case .int(let int):
            stringValue = String(int)
        case .string(let string):
            stringValue = string
        case .none:
            return stringValue
        }
        return stringValue
    }
    
}
