//
//  CustomersViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/23/26.
//

import Foundation

protocol CustomersViewModelDelegate: AnyObject {
    func reloadData()
    func didReceiveError(error: ErrorList)
}

final class CustomersViewModel {
    weak var delegate: CustomersViewModelDelegate?
    
    private let session: Session = .shared
    
    private let customerRepository: CustomersRepository
    
    init(customerRepository: CustomersRepository) {
        self.customerRepository = customerRepository
    }
    
    func readData() {
        customerRepository.readCustomer { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let responseModel):
                session.addCustomers(items: responseModel)
                delegate?.reloadData()
            case .failure(let failure):
                delegate?.didReceiveError(error: failure)
            }
        }
    }
    
//    private func saveUserDefaults(customerModel: [Customers]) {
//        customerRepository.saveCustomer(model: customerModel) { [weak self] result in
//            guard let self else {return}
//            
//            switch result {
//            case .success(let data):
//                UserDefaults.standard.customerData = data
//                delegate?.reloadData()
//            case .failure(let failure):
//                delegate?.didReceiveError(error: failure)
//            }
//        }
//    }
}

extension CustomersViewModel { //Bu kod Session-dakı datanı ViewModel vasitəsilə oxumaq üçündür
    var customerModel: [Customers] {
        return session.customerModel
    }
}
