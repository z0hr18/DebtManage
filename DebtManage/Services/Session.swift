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
    
    func readDataCustomer() { //UserDefaults → Session.customerModel
        //ilk root veziyyetinde men userdefaultsdan melumatlari cekib bura yazmaliyam customer ucun
        // User defaults read customers model
      
        if let data = UserDefaults.standard.customerData {
            if let customers = try? JSONDecoder().decode([Customers].self, from: data) {
                customerModel = customers
            }
        }
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
        saveData()
    }
    
    func saveData() { //customerModel -> UserDefaults
        if let data = try? JSONEncoder().encode(customerModel) {
            UserDefaults.standard.customerData = data
        }
    }
}
