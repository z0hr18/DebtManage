////
////  DataManager.swift
////  DebtManage
////
////  Created by Zohra Guliyeva on 2/24/26.
////
//
//
//import Foundation
//
//final class DataManager {
//    
//    private let codable: CodableManager
//    
//    func saveData(model: [Customers]) { //encode elediyimi deyishene assign edib userdefaultsa set edirem
//        if let data = encode(model: model) {
//            //            userDefaults.set(data, forKey: keyForData)
//            UserDefaults.standard.data = data
//        }
//    }
//    
////    func readData() -> [Customers] { //userdefaultsa yazdigim datani modele cevirirem
////        if let writedData = UserDefaults.standard.data { //datani aldim
////            let decode = decode(data: writedData)
////            return decode
////        } else {
////            print("no data")
////        }
////        return []
////    }
//
////    
////    func saveDataProccess(model: [Customers], completion: @escaping(Result<Error>) -> Void) {
////        if let data = encodeProccess(model: model, completion: completion) {
////            UserDefaults.standard.data = data
////        }
////    }
////    
//    
//    func readDataProccess(completion: @escaping(Result<[Customers], Error>) -> Void) {
//        if let writedData = UserDefaults.standard.data {
//            decodeProccess(data: writedData, completion: completion)
//        }
//    }
//    
//    func decodeProccess<T: Decodable> (data: Data, completion: @escaping(Result<T, Error>) -> Void) { //datani modele cevirirem
//        do {
//            let model = try JSONDecoder().decode(T.self, from: data)
//            completion(.success(model))
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//    func encodeProccess<T: Encodable>(model: T, completion: @escaping(Result<Data, Error>) -> Void) { // modeli Dataya cevirirem
//        do {
//            let data = try JSONEncoder().encode(model)
//            completion(.success(data))
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//        func encode<T: Encodable>(model: T) -> Data? {// modeli Dataya cevirirem
//            do {
//                let data = try JSONEncoder().encode(model)
//                return data
//            } catch {
//                print(error.localizedDescription)
//            }
//            return nil
//        }
//    //
//    //    func decode<T: Decodable>(data: Data) -> T { //datani modele cevirirem
//    //
//    //        do{
//    //            let model = try JSONDecoder().decode(T.self, from: data)
//    //            return model
//    //        } catch {
//    //            print(error.localizedDescription)
//    //        }
//    //    }
//    
//}
