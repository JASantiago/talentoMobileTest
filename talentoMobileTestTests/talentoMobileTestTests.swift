//
//  talentoMobileTestTests.swift
//  talentoMobileTestTests
//
//  Created by  Jose  Santiago on 4/25/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import XCTest
@testable import talentoMobileTest

class talentoMobileTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToggilingVisibility() {
        let storyboard = UIStoryboard(name: "AccountsList", bundle: nil)
        
        
        let accountsVC = storyboard.instantiateInitialViewController() as! AccountsListViewController
        let visibleAccountsCount =  AccountsListDataManager().fetchAccountsData()?.accounts.count
        accountsVC.viewDidLoad()
        accountsVC.updateVisibilityValue()
//        let totalAccountsCount = AccountsListDataManager().fetchAccountsData()?.accounts.count
//        XCTAssertNotEqual(visibleAccountsCount, totalAccountsCount)
    }

}
