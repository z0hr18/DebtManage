//
//  AddCustomersViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

protocol AddCustomersViewModelDelegate: AnyObject {
    func didError(error: ErrorList)
}

final class AddCustomersViewModel {
    
    private(set) var customerModel: [Customers] = []
    
    weak var delegate: AddCustomersViewModelDelegate?
    private let repo: CustomersRepository
    
    init(repo: CustomersRepository) {
        self.repo = repo
    }
    
    
    //    func saveData() {
    //        repo.saveCustomer(model: customerModel) { error in
    //            if let error {
    //                self.delegate?.didError(error: error)
    //            }
    //        }
    //    }
    
    func readData() {
        repo.readCustomer { result in
            switch result {
            case .success(let data):
                self.customerModel = data
            case .failure(let failure):
                self.delegate?.didError(error: failure)
            }
        }
    }
    
    func saveNewCustomer(name: String, surname: String, phone: String) {
        let newCustomer = Customers(name: name, surname: surname, phone: phone)
        repo.readCustomer { result in
            switch result {
            case .success(let customers):
                self.customerModel = customers
                self.customerModel.append(newCustomer)
            case .failure:
                break
            }
            
        }
    }
}
