//
//  AddCustomersViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

protocol AddCustomersViewModelDelegate: AnyObject {
    func didError(error: ErrorList)
    func didSaveCustomer()
}

final class AddCustomersViewModel {
    weak var delegate: AddCustomersViewModelDelegate?
    private let session: Session = .shared
    
    //    func saveData() {
    //        repo.saveCustomer(model: customerModel) { error in
    //            if let error {
    //                self.delegate?.didError(error: error)
    //            }
    //        }
    //    }
    
//    func readData() {
//        repo.readCustomer { result in
//            switch result {
//            case .success(let data):
//                self.customerModel = data
//            case .failure(let failure):
//                self.delegate?.didError(error: failure)
//            }
//        }
//    }
    
    func saveNewCustomer(name: String, surname: String, phone: String) {
        let newCustomer = Customers(name: name, surname: surname, phone: phone)
//        repo.readCustomer { result in
//            switch result {
//            case .success(let customers):
//                self.customerModel = customers
//                self.customerModel.append(newCustomer)
//            case .failure:
//                break
//            }
//        }
        session.addCustomer(item: newCustomer)
        delegate?.didSaveCustomer()
    }
}
