//
//  AddCustomersViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

protocol AddCustomersViewModelDelegate: AnyObject {
    func didError(error: ErrorList)
    func refreshUIData()
}

final class AddCustomersViewModel {
    
    private(set) var customerModel: [Customers] = []
    
    weak var delegate: AddCustomersViewModelDelegate?
    private var repo: CustomersRepository = .shared
    
    func saveData() {
        repo.saveCustomer(model: customerModel) { error in
            if let error {
                self.delegate?.didError(error: error)
            }
        }
    }
    
    func readData() {
        repo.readCustomer { result in
            switch result {
            case .success(let data):
                self.customerModel = data
                self.delegate?.refreshUIData()
            case .failure(let failure):
                self.delegate?.didError(error: failure)
            }
        }
    }
    
    func saveNewCustomer(name: String, surname: String, phone: String) {
        let newCustomer = Customers(name: name, surname: surname, phone: phone)
        repo.readCustomer { result in
            switch result {
            case .success(var customers):
                customers.append(newCustomer)
            case .failure:
                break
            }
            
        }
 
    }
    
}
