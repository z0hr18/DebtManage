//
//  HeaderCell.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/13/26.
//

import UIKit

protocol HeaderCellDelegate: AnyObject {
    func didSelectHeaderIndex(section: Int)
}

class HeaderCell: UITableViewHeaderFooterView {
    weak var delegate: HeaderCellDelegate?
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Borc ödə", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAddMenu), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fullNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            payButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            payButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            payButton.widthAnchor.constraint(equalToConstant: 100),
            payButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func cellConfig(fullName: String) {
        fullNameLabel.text = fullName
    }
    
    @objc private func didTapAddMenu() {
        delegate?.didSelectHeaderIndex(section: self.tag)
    }
}
