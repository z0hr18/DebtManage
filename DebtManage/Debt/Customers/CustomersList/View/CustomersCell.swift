//
//  CustomersCell.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import UIKit

class CustomersCell: UITableViewCell {
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, phoneLabel])
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .fill
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubViews(views: vStack)
        
        NSLayoutConstraint.activate([
           vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
           vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
           vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
           vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func cellConfig(customers: Customers) {
        fullnameLabel.text = "\(customers.name) \(customers.surname)"
        phoneLabel.text = customers.phone
    }
    
}
