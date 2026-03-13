//
//  ReceivableViewController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/9/26.
//

import UIKit

class ReceivablesViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(ReceivablesCell.self)
        view.register(HeaderCell.self, forHeaderFooterViewReuseIdentifier: HeaderCell.description())
        //        view.register(FooterCell.self, forHeaderFooterViewReuseIdentifier: FooterCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel: ReceivablesViewModel {
        let viewModel = ReceivablesViewModel(receivableRepository: ReceivablesRepositoryImpl())
        viewModel.delegate = self
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIConfiguration()
        setupUI()
    }
    
    private func setupUIConfiguration() {
        view.backgroundColor = .white
        title = "Alacaqlar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        viewModel.readData()
        
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

// MARK: - MAIN CELL
extension ReceivablesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.debtModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let debtsCustomer = viewModel.debtModel[indexPath.row]
        return tableView.reuseable(cell: ReceivablesCell.self, indexPath: indexPath) { cell in
            cell.cellConfig(debts: debtsCustomer)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
// MARK: - HEADER CELL
extension ReceivablesViewController {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let debt = viewModel.debtModel[section]
        
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderCell.description()
        ) as? HeaderCell else { return nil }
        
        header.cellConfig(fullName: debt.customer)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

// MARK: - FOOTER CELL
extension ReceivablesViewController {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterCell.description()) as? FooterCell else { return nil }
        
        let debt = viewModel.debtModel[section].amount //amount ve currency
        
//        footer.configure
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ReceivablesViewController: ReceivablesViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
    
    func didReceiveError(error: ErrorList) {
        print(error.description)
    }
}


