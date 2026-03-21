//
//  UIViewController+Ext.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/21/26.
//

import UIKit

extension UIViewController {
    func setLargeTitle(title: String) {
        self.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
