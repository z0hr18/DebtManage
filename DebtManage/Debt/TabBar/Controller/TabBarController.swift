//
//  TabBarController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/5/26.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabUI()
    }
    
    private func setUpTabUI() {
        let checkout = UINavigationController(rootViewController: CheckoutViewController())
        checkout.tabBarItem = UITabBarItem(title: "Checkout", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let receivables = UINavigationController(rootViewController: ReceivablesViewController())
        receivables.tabBarItem = UITabBarItem(title: "Receivables", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let payments = UINavigationController(rootViewController: PaymentsViewController())
        payments.tabBarItem = UITabBarItem(title: "Payments", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let customers = UINavigationController(rootViewController: CustomersViewController())
        customers.tabBarItem = UITabBarItem(title: "Customers", image: UIImage(systemName: "house"), selectedImage: nil)
        
        viewControllers = [checkout, receivables, payments, customers]
    }
}
