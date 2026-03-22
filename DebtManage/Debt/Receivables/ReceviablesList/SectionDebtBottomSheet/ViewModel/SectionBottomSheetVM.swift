//
//  SectionBottomSheetVM.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/21/26.
//

import UIKit

final class SectionBottomSheetVM {
    private let session: Session = .shared
    
    private var sectionDebt: [NewDebts] = []
    private var sectionIndex: Int = 0
    
    func configure(sectionDebt: [NewDebts], sectionIndex: Int) {
        self.sectionDebt = sectionDebt
        self.sectionIndex = sectionIndex
    }
    
    var items: [NewDebts] {
        return sectionDebt
    }
    
    
    func payDebt(rowIndex: Int, paidAmount: Double) {
        let current = sectionDebt[rowIndex].amount
        let calculateAmound  = current - paidAmount
        sectionDebt[rowIndex].amount = calculateAmound

        session.updateDebt(sectionIndex: sectionIndex, rowIndex: rowIndex, paidAmount: paidAmount)
    }
    
    
    var sections: [SectionDebt] {
        return session.sectionModel
    }
}

