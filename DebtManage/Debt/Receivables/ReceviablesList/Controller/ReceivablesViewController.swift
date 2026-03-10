//
//  ReceivableViewController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/9/26.
//

import UIKit

class ReceivablesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIConfiguration()

        // Do any additional setup after loading the view.
    }
    private func setupUIConfiguration() {
        view.backgroundColor = .white
        title = "Alacaqlar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc
    func addTapped() {
        let vc = NewDebtViewController()
        show(vc, sender: self)
    }


}
