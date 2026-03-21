//
//  SectionBottomSheetVM.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/21/26.
//

import UIKit

final class SectionBottomSheetVM {
    private let session: Session = .shared
    
    private(set) var items: [NewDebts] = []
    
    func setItems(items: [NewDebts]) {
        self.items = items
    }
    
    var debts: [NewDebts] {
        return session.debtsModel
    }
}

