//
//  NewDebts.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/10/26.
//

import Foundation

struct NewDebts: Codable {
    let customer: String
    let amount: Double
    let currency: String
    let date: Date?
    let note: String
}
