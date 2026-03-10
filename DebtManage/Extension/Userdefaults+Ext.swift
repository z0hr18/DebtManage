//
//  Userdefaults+Ext.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/26/26.
//

import Foundation

extension UserDefaults {
    
    enum Keys: String {
        case keyForDataCustomers = "@1234567890@"
        case keyForDataDebts = "@987654321"
    }
    
    var customerData: Data? {
        get {
            data(forKey: Keys.keyForDataCustomers.rawValue)
        }
        
        set {
            setValue(newValue, forKey: Keys.keyForDataCustomers.rawValue)
        }
    }
    
    var debtsData: Data? {
        get {
            data(forKey: Keys.keyForDataDebts.rawValue)
        }
        
        set {
            setValue(newValue, forKey: Keys.keyForDataDebts.rawValue)
        }
    }
    
    
}
