//
//  CodableManager.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import Foundation

final class CodableManager {
    
    func encodeProccess<T: Encodable>(model: T, completion: @escaping(Result<Data, ErrorList>) -> Void) { // modeli Dataya cevirirem
        do {
            let data = try JSONEncoder().encode(model)
            completion(.success(data))
        } catch {
            completion(.failure(.badEncoding))
        }
    }
    
    func decodeProccess<T: Decodable> (data: Data?, completion: @escaping(Result<T, ErrorList>) -> Void) { //datani modele cevirirem
        guard let data else {
            completion(.failure(.noData))
            return
        }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            completion(.success(model))
        } catch {
            completion(.failure(.badParsing))
        }
    }   
}
