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
    private(set) var debtsModel: [NewDebts] = []
    
    func readDataCustomer() {
        if let data = UserDefaults.standard.customerData {
            if let customers = try? JSONDecoder().decode([Customers].self, from: data) {
                customerModel = customers
            }
        }
    }
    
    func readDataDebts() {
        if let data = UserDefaults.standard.debtsData {
            if let debts = try? JSONDecoder().decode([NewDebts].self, from: data) {
                debtsModel = debts
            }
        }
    }
    
 }

// MARK: - Customers
extension Session {
   
    func addCustomer(item: Customers) {
        customerModel.append(item)
        saveDataCustomer()
    }
    
    func addCustomers(items: [Customers]) {
        customerModel = items
        saveDataCustomer()
    }
    
    func saveDataCustomer() {
        if let data = try? JSONEncoder().encode(customerModel) {
            UserDefaults.standard.customerData = data
        }
    }
}

// MARK: - New Debt
extension Session {
   
    func addNewDebtCustomer(item: NewDebts) {
        debtsModel.append(item)
        saveDataDebts()
    }
    
    func addNewDebtCustomers(items: [NewDebts]) {
        debtsModel = items
        saveDataDebts()
    }
    
    func saveDataDebts() {
        if let data = try? JSONEncoder().encode(debtsModel) {
            UserDefaults.standard.debtsData = data
        }
    }
}
