//
//  PaymentsViewModel.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/23/26.
//

import Foundation

final class PaymentsViewModel {
    private let session: Session = .shared
    
    var items: [NewDebts] {
       return session.paidDebts
    }
}
