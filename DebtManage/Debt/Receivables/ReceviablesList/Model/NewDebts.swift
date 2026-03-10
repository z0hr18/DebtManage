//
//  NewDebts.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/10/26.
//

import Foundation

struct NewDebts: Codable {
    let customer: Customers
    let amount: Double
    let currency: String
    let note: String
}
