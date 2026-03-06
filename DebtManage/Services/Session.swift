//
//  Session.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/6/26.
//

import Foundation

final class Session {
    
    static let shared = Session()
    private init() {}
    
    private(set) var customerModel: [Customers] = []
    
    func readDataCustomer() {
        //ilk root veziyyetinde men userdefaultsdan melumatlari cekib bura yazmaliyam customer ucun
        // User defaults read customers model
    }
 }

// MARK: - Customers
extension Session {
   
    func addCustomer(item: Customers) {
        customerModel.append(item)
        // Save to UserDefaults
        saveData()
    }
    
    func addCustomers(items: [Customers]) {
        customerModel = items
    }
    
    func saveData() {
        
    }
}
