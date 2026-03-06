//
//  CustomersRepository.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

protocol CustomersRepository: BaseRepository {
    func saveCustomer(model: [Customers], completion: @escaping(Result<Data, ErrorList>) -> Void)
    func readCustomer(completion: @escaping(Result<[Customers], ErrorList>) -> Void)
}

class CustomersRepositoryImpl: CustomersRepository {
    
    func saveCustomer(model: [Customers], completion: @escaping(Result<Data, ErrorList>) -> Void) {
        codable.encodeProccess(model: model, completion: completion)
    }
    
    func readCustomer(completion: @escaping(Result<[Customers], ErrorList>) -> Void) {
        codable.decodeProccess(data: UserDefaults.standard.customerData, completion: completion)
    }
    
}
