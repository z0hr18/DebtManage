//
//  NewDebts.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/10/26.
//

import Foundation

struct SectionDebt: Codable {
    let sectionName: String
    var data: [NewDebts]
}

struct NewDebts: Codable {
    let customer: String
    var amount: Double
    let currency: String
    let date: Date?
    let note: String
}
