//
//  ErrorList.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

enum ErrorList: Error {
    case noData
    case badEncoding
    case badParsing

    
    var description: String {
        switch self {
        case .noData:
            return "No data"
        case .badEncoding:
            return "Decode bad encoding error"
        case .badParsing:
            return "Decode bad parsing error"
        }
    }
}
