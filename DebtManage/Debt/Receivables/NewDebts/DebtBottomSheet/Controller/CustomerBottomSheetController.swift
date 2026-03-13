//
//  CustomerBottomSheetController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/12/26.
//

import UIKit

protocol CustomerSelectionDelegate: AnyObject {
    func didSelectCustomer(customer: Customers)
}

class CustomerBottomSheetController: UIViewController {
    
    weak var delegate: CustomerSelectionDelegate?
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(CustomerBottomSheetCell.self)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private var viewModel: CustomerBottomSheetVM {
        let viewModel = CustomerBottomSheetVM()
        return viewModel
    }
    
    private func setupTableView() {
        view.anchor(view: tableView) { tableView in
            tableView.top(16)
            tableView.leading(16)
            tableView.trailing(16)
            tableView.bottom(16)
        }
    }
    
}

extension CustomerBottomSheetController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customer = viewModel.customers[indexPath.row]
        return tableView.reuseable(cell: CustomerBottomSheetCell.self, indexPath: indexPath) { cell in
            cell.cellConfig(customers: customer)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCustomer = viewModel.customers[indexPath.row]
        delegate?.didSelectCustomer(customer: selectedCustomer)
        dismiss(animated: true)
    }
}
