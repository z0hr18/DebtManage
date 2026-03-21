//
//  ReceivablesViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/23/26.
//

import Foundation

protocol ReceivablesViewModelDelegate: AnyObject {
    func reloadData()
    func didReceiveError(error: ErrorList)
}

final class ReceivablesViewModel {
    weak var delegate: ReceivablesViewModelDelegate?
    
    private let session: Session = .shared
    private(set) var selectedCustomerIndex: Int = 0
    private(set) var sectionModel: SectionModel?
    
    private let receivableRepository: ReceivablesRepository
    
    init(receivableRepository: ReceivablesRepository) {
        self.receivableRepository = receivableRepository
    }

    
    func readData() {
        receivableRepository.readNewDebts { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let responseModel):
                session.addNewSectionDebtCustomers(items: responseModel)
                delegate?.reloadData()
            case .failure(let failure):
                delegate?.didReceiveError(error: failure)
            }
        }
    }
    
}

extension ReceivablesViewModel { //Bu kod Session-dakı datanı ViewModel vasitəsilə oxumaq üçündür
    var sections: [SectionDebt] {
        return session.sectionModel
    }
}

extension ReceivablesViewModel {//borc ode button
    func customerDebt() {
        let tappedSectionModel = SectionModel(sectionIndex: selectedCustomerIndex)
        self.sectionModel = tappedSectionModel
    }
}
