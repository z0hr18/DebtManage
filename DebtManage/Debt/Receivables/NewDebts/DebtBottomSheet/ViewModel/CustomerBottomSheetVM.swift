//
//  CustomerBottomSheetVM.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/12/26.
//

import Foundation

final class CustomerBottomSheetVM {
    
    private let session: Session = .shared
    
    var customers: [Customers] { ///Bu kod Session-dakı datanı ViewModel vasitəsilə oxumaq üçündür
        return session.customerModel
    }

}
