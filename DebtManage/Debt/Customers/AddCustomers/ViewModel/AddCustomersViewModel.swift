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
    
    func saveNewCustomer(name: String, surname: String, phone: String) {
        let newCustomer = Customers(name: name, surname: surname, phone: phone)
        session.addCustomer(item: newCustomer)
        delegate?.didSaveCustomer()
    }
}
