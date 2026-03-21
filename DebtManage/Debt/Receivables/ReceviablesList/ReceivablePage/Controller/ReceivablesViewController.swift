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
        view.register(FooterCell.self, forHeaderFooterViewReuseIdentifier: FooterCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        return view
    }()
    
    private lazy var viewModel: ReceivablesViewModel = {
        let vm = ReceivablesViewModel(receivableRepository: ReceivablesRepositoryImpl())
        vm.delegate = self
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
        setLargeTitle(title: "Alacaqlar")
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
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let debtsCustomer = viewModel.sections[indexPath.section].data[indexPath.row]
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
        
        let sectionName = viewModel.sections[section].sectionName
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.description()) as? HeaderCell else { return nil }
        header.tag = section
        header.delegate = self
        header.cellConfig(fullName: sectionName)
        
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

        let debts = viewModel.sections[section].data

        footer.configure(items: debts)

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

extension ReceivablesViewController: HeaderCellDelegate {

    func didSelectHeaderIndex(section: Int) {
        let selectedItems = viewModel.sections[section].data
      
        
        let bottomSheetVC = SectionDebtBottomSheetController()
        bottomSheetVC.viewModel.setItems(items: selectedItems)
        
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [
                .medium()
            ]
            
            sheet.prefersGrabberVisible = true
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    
    func showSectionsData() {
        
    }
    
    
    
}

extension ReceivablesViewController {
    
}

