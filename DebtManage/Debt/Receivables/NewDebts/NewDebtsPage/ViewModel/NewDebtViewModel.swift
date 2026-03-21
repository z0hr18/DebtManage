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
    
    private(set) var selectedCurrency: String = "USD"
    
    weak var delegate: NewDebtViewModelDelegate?
    private let session: Session = .shared
    
    
    
    func saveNewDebt(fullName: String, price: Double, currency: String, description: String) {
        let newDebts = NewDebts(customer: fullName, amount: price, currency: currency, date: Date(), note: description)
        if let sectionIndex = session.sectionModel.firstIndex(where: {$0.sectionName == fullName}) {
            session.addItem(index: sectionIndex, item: newDebts)
        } else {
            let section = SectionDebt(sectionName: fullName, data: [newDebts])
            session.addSectionItem(item: section)
        }
        delegate?.didSaveDebts()
    }
        
    func updateCurrency(index: Int) {
        selectedCurrency = currencies[index]
    }
}
