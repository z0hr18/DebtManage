//
//  AddCustomersViewController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 2/27/26.
//

import UIKit

class AddCustomersViewController: UIViewController {
        
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Adınız:"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Soyadınız:"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Telefonunuz:"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let nameTexfield: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Adınızı daxil edin"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let surnameTexfield: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Soyadınızı daxil edin"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let priceTexfield: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Price"
        txtField.borderStyle = .roundedRect
        txtField.keyboardType = .decimalPad
        return txtField
    }()
    
    private let numberTexfield: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Mobil nömrənizi daxil edin"
        txtField.borderStyle = .roundedRect
        txtField.keyboardType = .phonePad
        txtField.autocorrectionType = .no
        txtField.autocapitalizationType = .none
        return txtField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Qeyd et", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    var viewModel: AddCustomersViewModel = {
        let vm = AddCustomersViewModel(repo: CustomersRepositoryImpl())
        return vm
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Yeni müştəri yarat"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        setupConstraints()
    }
    
    
    
    private func setupConstraints() {
        view.addSubViews(views: nameLabel, nameTexfield, surnameLabel, surnameTexfield, phoneLabel, numberTexfield, saveButton)
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameTexfield.topAnchor.constraint( equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTexfield.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor ),
            nameTexfield.trailingAnchor.constraint( equalTo: view.trailingAnchor,constant: -20),
            nameTexfield.heightAnchor.constraint(equalToConstant: 44),
            
            
            surnameLabel.topAnchor.constraint(equalTo: nameTexfield.bottomAnchor, constant: 20),
            surnameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            surnameTexfield.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor,constant: 8),
            surnameTexfield.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            surnameTexfield.trailingAnchor.constraint(equalTo: nameTexfield.trailingAnchor),
            surnameTexfield.heightAnchor.constraint(equalToConstant: 44),
            
            
            phoneLabel.topAnchor.constraint(equalTo: surnameTexfield.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            numberTexfield.topAnchor.constraint( equalTo: phoneLabel.bottomAnchor, constant: 8),
            numberTexfield.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            numberTexfield.trailingAnchor.constraint(equalTo: nameTexfield.trailingAnchor),
            numberTexfield.heightAnchor.constraint(equalToConstant: 44),
            
            saveButton.topAnchor.constraint(equalTo: numberTexfield.bottomAnchor, constant: 12),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            saveButton.widthAnchor.constraint(equalToConstant: 70),
            saveButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc
    func buttonTapped() {
        guard let name = nameTexfield.text, !name.isEmpty else { return }
        guard let surname = surnameTexfield.text, !name.isEmpty else { return }
        guard let number = numberTexfield.text, !name.isEmpty else { return }
        
        viewModel.saveNewCustomer(name: name, surname: surname, phone: number)

    }
}


extension AddCustomersViewController: AddCustomersViewModelDelegate {
    func didError(error: ErrorList) {
        print(error.description)
    }
    
   
}
    

