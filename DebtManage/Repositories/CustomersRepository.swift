//
//  CustomersRepository.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

class CustomersRepository {
    static let shared = CustomersRepository()
    private let codable = CodableManager()
    
    func saveCustomer(model: [Customers], completion: @escaping(ErrorList?) -> Void) {
        codable.encodeProccess(model: model) { result in
            switch result {
            case .success(let data):
                UserDefaults.standard.customerData = data
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func readCustomer(completion: @escaping(Result<[Customers], ErrorList>) -> Void) {
        codable.decodeProccess(data: UserDefaults.standard.customerData, completion: completion)
    }
    
}
