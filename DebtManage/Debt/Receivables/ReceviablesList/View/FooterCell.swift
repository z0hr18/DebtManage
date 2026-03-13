//
//  FooterCell.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/13/26.
//

import UIKit

class FooterCell: UITableViewHeaderFooterView {
    
    private let aznLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tlLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let eurLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
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
        
        contentView.addSubview(aznLabel)
        contentView.addSubview(tlLabel)
        contentView.addSubview(usdLabel)
        contentView.addSubview(eurLabel)
        
        NSLayoutConstraint.activate([
            
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
    
    func configure(azn: Double, usd: Double, tl: Double, eur: Double) {
        aznLabel.text = "\(azn) AZN"
        usdLabel.text = "\(usd) USD"
        tlLabel.text = "\(tl) TL"
        eurLabel.text = "\(eur) EUR"
    }

}
