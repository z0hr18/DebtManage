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
    private(set) var sectionModel: [SectionDebt] = []
    private(set) var debtsModel: [NewDebts] = []
    
    func readAll() {
        readDataCustomer()
        readDataSectionDebts()
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
    
    func readDataCustomer() {
        if let data = UserDefaults.standard.customerData {
            if let customers = try? JSONDecoder().decode([Customers].self, from: data) {
                customerModel = customers
            }
        }
    }

}


extension Session {
    func addItem(index: Int, item: NewDebts) {
        sectionModel[index].data.append(item)
        saveDataSectionDebts()
    }
    
    func addSectionItem(item: SectionDebt) {
        sectionModel.append(item)
        saveDataSectionDebts()
    }

    func addNewSectionDebtCustomers(items: [SectionDebt]) {
        sectionModel = items
        saveDataSectionDebts()
    }
    
    func saveDataSectionDebts() {
        if let data = try? JSONEncoder().encode(sectionModel) {
            UserDefaults.standard.debtsData = data
        }
    }
    
    func readDataSectionDebts() {
        if let data = UserDefaults.standard.debtsData {
            if let debts = try? JSONDecoder().decode([SectionDebt].self, from: data) {
                sectionModel = debts
            }
        }
    }
}

