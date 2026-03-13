//
//  UIViewController.swift
//  AnchorKit
//
//  Created by Habiboff on 02.09.23.
//  Copyright © 2023 Nahid Habibov. All rights reserved.
//

import UIKit

public extension StackViewProtocol where Self: UIViewController {
    
    @discardableResult
    func withSize<T: UIView>(_ size: CGSize) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self.view as! T
    }
    
    @discardableResult
    func withHeight(_ height: CGFloat) -> UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self.view
    }
    
    @discardableResult
    func withWidth(_ width: CGFloat) -> UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self.view
    }
    
    @discardableResult
    func withBorder<T: UIView>(width: CGFloat, color: UIColor) -> T {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
        return self.view as! T
    }
}
