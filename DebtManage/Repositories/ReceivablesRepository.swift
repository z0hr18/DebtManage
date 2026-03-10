//
//  ReceivablesRepository.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/10/26.
//
import Foundation

protocol ReceivablesRepository: BaseRepository {
    func saveNewDebts(model: [NewDebts], completion: @escaping(Result<Data, ErrorList>) -> Void)
    func readNewDebts(completion: @escaping(Result<[NewDebts], ErrorList>) -> Void)
}

class ReceivablesRepositoryImpl: ReceivablesRepository {
    
    func saveNewDebts(model: [NewDebts], completion: @escaping(Result<Data, ErrorList>) -> Void) {
        codable.encodeProccess(model: model, completion: completion)
    }
    
    func readNewDebts(completion: @escaping(Result<[NewDebts], ErrorList>) -> Void) {
        codable.decodeProccess(data: UserDefaults.standard.debtsData, completion: completion)
    }
    
}
