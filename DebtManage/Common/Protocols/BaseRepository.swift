//
//  BaseRepository.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/6/26.
//

import Foundation

protocol BaseRepository {
    var codable: CodableManager { get }
}

extension BaseRepository {
    var codable: CodableManager {
        return .init()
    }
}
