//
//  CustomerViewController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/9/26.
//

import UIKit

class CustomersViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(CustomersCell.self, forCellReuseIdentifier: CustomersCell.description())
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Müştərilər"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        setupTableView()
        
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
        navigationItem.rightBarButtonItem = addButton
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.readData()
        tableView.reloadData()
      
    }
    
    private func setupTableView() {
        view.addSubViews(views: tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private var viewModel: CustomersViewModel {
        let viewModel = CustomersViewModel()
        return viewModel
    }
    
    
    @objc
    func addTapped() {
        let vc = AddCustomersViewController()
        show(vc, sender: self)
    }
}

extension CustomersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.customerModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customer = viewModel.customerModel[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomersCell.description(), for: indexPath) as? CustomersCell {
            cell.cellConfig(customers: customer)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
