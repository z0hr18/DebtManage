//
//  CustomersViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/23/26.
//

import Foundation

final class CustomersViewModel {
    private let repo: CustomersRepository = .shared
    
    private(set) var customerModel: [Customers] = []
    
    func readData() {
        repo.readCustomer { result in
            switch result {
            case .success(let data):
                self.customerModel = data
                print("Data: \(self.customerModel)")
            case .failure(let failure):
                print("❌ readData error:", failure)
            }
        }
    }
}
