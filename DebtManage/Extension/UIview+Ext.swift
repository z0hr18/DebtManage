//
//  UIview+Ext.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import UIKit

extension UIView {
    
    func addSubViews(views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
}
