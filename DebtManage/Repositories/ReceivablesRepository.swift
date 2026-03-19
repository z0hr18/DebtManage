//
//  ReceivablesRepository.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/10/26.
//
import Foundation

protocol ReceivablesRepository: BaseRepository {
    func saveNewDebts(model: [SectionDebt], completion: @escaping(Result<Data, ErrorList>) -> Void)
    func readNewDebts(completion: @escaping(Result<[SectionDebt], ErrorList>) -> Void)
}

class ReceivablesRepositoryImpl: ReceivablesRepository {
    
    func saveNewDebts(model: [SectionDebt], completion: @escaping(Result<Data, ErrorList>) -> Void) {
        codable.encodeProccess(model: model, completion: completion)
    }
    
    func readNewDebts(completion: @escaping(Result<[SectionDebt], ErrorList>) -> Void) {
        codable.decodeProccess(data: UserDefaults.standard.debtsData, completion: completion)
    }
    
}
