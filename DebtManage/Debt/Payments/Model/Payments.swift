//
//  Payments.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/22/26.
//

import UIKit

struct SectionPayments: Codable {
    let sectionName: String
    var data: [Payments]
}

struct Payments: Codable {
    let customer: String
    var payment: Double
    let currency: String
    let date: Date?
    let note: String
}
