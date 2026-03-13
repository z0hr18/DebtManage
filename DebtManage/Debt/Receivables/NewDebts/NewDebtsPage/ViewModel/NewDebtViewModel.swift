//
//  NewDebtViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/13/26.
//

import Foundation

protocol NewDebtViewModelDelegate: AnyObject {
    func didError(error: ErrorList)
    func didSaveDebts()
}

final class NewDebtViewModel {
    private(set) var currencies: [String] = [
        "USD", "EUR", "TL", "AZN", "RUB"
    ]
    
    weak var delegate: NewDebtViewModelDelegate?
    private let session: Session = .shared
    
    func saveNewDebt(fullName: String, price: Double, currency: String, description: String) {
        let newDebt = NewDebts(customer: fullName, amount: price, currency: currency, date: Date(), note: description)
        session.addNewDebtCustomer(item: newDebt)
        delegate?.didSaveDebts()
    }
}
