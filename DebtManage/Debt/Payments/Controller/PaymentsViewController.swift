//
//  PaymentViewController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/9/26.
//

import UIKit

class PaymentsViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let view = UITableView()
//        view.delegate = self
//        view.dataSource = self
        view.register(PaymentsCell.self)
        view.register(PaymentsHeaderCell.self, forHeaderFooterViewReuseIdentifier: PaymentsHeaderCell.description())
        view.register(PaymentsFooterCell.self, forHeaderFooterViewReuseIdentifier: PaymentsFooterCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        return view
    }()
    
    private lazy var viewModel: PaymentsViewModel = {
        let vm = PaymentsViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIConfiguration()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    private func setupUIConfiguration() {
        view.backgroundColor = .white
        setLargeTitle(title: "ödənişlər")
       
    }
    
    func setupUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
