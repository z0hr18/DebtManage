//
//  PaymentsFooterCell.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/22/26.
//

import UIKit

class PaymentsFooterCell: UITableViewHeaderFooterView {
    private let lineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let aznLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tlLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let eurLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.addSubview(lineView)
        contentView.addSubview(aznLabel)
        contentView.addSubview(tlLabel)
        contentView.addSubview(usdLabel)
        contentView.addSubview(eurLabel)
        
        NSLayoutConstraint.activate([
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            aznLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            aznLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            tlLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tlLabel.topAnchor.constraint(equalTo: aznLabel.bottomAnchor, constant: 6),
            tlLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            usdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            usdLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            eurLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            eurLabel.topAnchor.constraint(equalTo: usdLabel.bottomAnchor, constant: 6),
            eurLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
    }
    
    func configure(items: [NewDebts]) {
        let aznItems = items.filter({$0.currency == "AZN"})
        let aznAmount = aznItems.compactMap({$0.amount}).reduce(0,+)
        let aznFormatter = String(format: "%.2f", aznAmount)
        aznLabel.text = "\(aznFormatter) AZN"
        
        let usdItems = items.filter({$0.currency == "USD"})
        let usdAmount = usdItems.compactMap({$0.amount}).reduce(0,+)
        let usdFormatter = String(format: "%.2f", usdAmount)
        usdLabel.text = "\(usdFormatter) USD"
        
        let tlItems = items.filter({$0.currency == "TL"})
        let tlAmount = tlItems.compactMap({$0.amount}).reduce(0,+)
        let tlFormatter = String(format: "%.2f", tlAmount)
        tlLabel.text = "\(tlFormatter) TL"

        
        let eurItems = items.filter({$0.currency == "EUR"})
        let eurAmount = eurItems.compactMap({$0.amount}).reduce(0,+)
        let eurFormatter = String(format: "%.2f", eurAmount)
        eurLabel.text = "\(eurFormatter) EUR"
    }
}
