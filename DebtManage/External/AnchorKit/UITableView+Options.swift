//
//  UITableView+Options.swift
//  AnchorKit
//
//  Created by Habiboff on 22.12.23.
//  Copyright © 2023 Nahid Habibov. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register(_ cell: AnyClass) {
        register(cell.self, forCellReuseIdentifier: cell.description())
    }
    
    public func reuseable<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath, completion: @escaping(T) -> Void) -> T {
        guard let itemCell = dequeueReusableCell(withIdentifier: cell.description(), for: indexPath) as? T else { return T() }
        completion(itemCell)
        return itemCell
    }
    
    public convenience init(cell: AnyClass, delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?) {
        self.init()
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(cell.self, forCellReuseIdentifier: cell.description())
    }
}
