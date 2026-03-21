//
//  SectionDebtBottomSheet.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/21/26.
//

import UIKit

class SectionDebtBottomSheetController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(SectionDebtBottomSheetCell.self, forCellReuseIdentifier: SectionDebtBottomSheetCell.description())
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
     lazy var viewModel: SectionBottomSheetVM = {
        let vm = SectionBottomSheetVM()
        return vm
    }()
    
    
    private func setupTableView() {
        view.anchor(view: tableView) { tableView in
            tableView.top(16)
            tableView.leading(16)
            tableView.trailing(16)
            tableView.bottom(16)
        }
    }
    
}

extension SectionDebtBottomSheetController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionDebts = viewModel.items[indexPath.row]
        return tableView.reuseable(cell: SectionDebtBottomSheetCell.self, indexPath: indexPath) { cell in
            cell.cellConfig(debts: sectionDebts)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let debt = viewModel.items[indexPath.row]
        showConfirmAlert(for: debt)
    }
    
    func showConfirmAlert(for debt: NewDebts) {

        let alert = UIAlertController(
            title: "Xəbərdarlıq!",
            message: "Seçilmiş olan \(debt.amount) \(debt.currency) dəyərindəki məbləğin ödənildiyini təsdiqləyirsiniz?",
            preferredStyle: .alert
        )

        alert.addTextField { tf in
            tf.text = "\(debt.amount)"
            tf.keyboardType = .decimalPad
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            
            let newValue = alert.textFields?.first?.text
            print("Yeni məbləğ:", newValue ?? "")
        }

        alert.addAction(cancel)
        alert.addAction(ok)

        present(alert, animated: true)
    }
}

