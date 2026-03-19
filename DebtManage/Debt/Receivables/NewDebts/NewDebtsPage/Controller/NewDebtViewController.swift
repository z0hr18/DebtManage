//
//  NewDebtViewController.swift
//  DebtManage
//
//  Created by Zohra Guliyeva on 3/10/26.
//

import UIKit

final class NewDebtViewController: UIViewController {
    //MARK: - Customer Selection
    
    private let customerSelectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let customerIconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let customerIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let customerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Müştəri seç"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let customerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Seçimdən sonra yenidən dəyişə bilərsiniz"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - PRICE
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Məbləğ"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private let amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0.00"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 26, weight: .medium)
        textField.textColor = .black
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let currencyTextField: UITextField = {
        let tf = UITextField()
        tf.isHidden = true
        return tf
    }()
    
    private lazy var currencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Seç", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.35).cgColor
        button.addTarget(self, action: #selector(currencyButtonTapped), for: .touchDown)
        return button
    }()
    
    // MARK: - Note
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Qeyd"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private let noteTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16, weight: .regular)
        textView.textColor = .black
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 12
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.35).cgColor
        textView.textContainerInset = UIEdgeInsets(top: 14, left: 12, bottom: 14, right: 12)
        return textView
    }()
    
    // MARK: - Button
    
    private lazy var createDebtButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Borc yarat", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(createNewDebtButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var viewModel: NewDebtViewModel = {
        let vm = NewDebtViewModel()
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Yeni borc yarat"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        viewModel.delegate = self
        setupUI()
        setupConstraints()
        setupSelectionAction()
    }
    
    private func setupSelectionAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(customerSelectionTapped))
        customerSelectionView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func currencyButtonTapped() {
        guard let currency =  viewModel.currencies.first else {return}
        viewModel.updateCurrency(index: 0)
        currencyTextField.becomeFirstResponder()
        currencyButton.setTitle(currency, for: .normal)
        
    }
    
    @objc
    func createNewDebtButtonTapped() {
        guard let fullName = customerTitleLabel.text,
              let priceText = amountTextField.text,
              let price = Double(priceText),
              let note = noteTextView.text
        else { return }
        
        viewModel.saveNewDebt( //ctrl m
            fullName: fullName,
            price: price,
            currency: viewModel.selectedCurrency,
            description: note
        )
    }
    
    @objc
    func customerSelectionTapped() {
        print("tapped selection")
        let bottomSheetVC = CustomerBottomSheetController()
        bottomSheetVC.delegate = self
        
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [
                .medium()
            ]
            
            sheet.prefersGrabberVisible = true
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    
    func setupUI() {
        currencyTextField.inputView = pickerView
        
        
        view.addSubViews(views: customerSelectionView, amountLabel, amountTextField, currencyButton, noteLabel, noteTextView, currencyTextField, createDebtButton)
        
        customerSelectionView.addSubview(customerIconContainer)
        customerIconContainer.addSubview(customerIconImageView)
        customerSelectionView.addSubview(customerTitleLabel)
        customerSelectionView.addSubview(customerSubtitleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // MARK: - Customer Selection View
            customerSelectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            customerSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            customerSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            customerSelectionView.heightAnchor.constraint(equalToConstant: 80),
            
            customerIconContainer.leadingAnchor.constraint(equalTo: customerSelectionView.leadingAnchor, constant: 16),
            customerIconContainer.centerYAnchor.constraint(equalTo: customerSelectionView.centerYAnchor),
            customerIconContainer.widthAnchor.constraint(equalToConstant: 42),
            customerIconContainer.heightAnchor.constraint(equalToConstant: 42),
            
            customerIconImageView.centerXAnchor.constraint(equalTo: customerIconContainer.centerXAnchor),
            customerIconImageView.centerYAnchor.constraint(equalTo: customerIconContainer.centerYAnchor),
            customerIconImageView.widthAnchor.constraint(equalToConstant: 24),
            customerIconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            customerTitleLabel.topAnchor.constraint(equalTo: customerSelectionView.topAnchor, constant: 18),
            customerTitleLabel.leadingAnchor.constraint(equalTo: customerIconContainer.trailingAnchor, constant: 16),
            customerTitleLabel.trailingAnchor.constraint(equalTo: customerSelectionView.trailingAnchor, constant: -16),
            
            customerSubtitleLabel.topAnchor.constraint(equalTo: customerTitleLabel.bottomAnchor, constant: 4),
            customerSubtitleLabel.leadingAnchor.constraint(equalTo: customerTitleLabel.leadingAnchor),
            customerSubtitleLabel.trailingAnchor.constraint(equalTo: customerSelectionView.trailingAnchor, constant: -16),
            
            
            // MARK: - Amount Section
            amountLabel.topAnchor.constraint(equalTo: customerSelectionView.bottomAnchor, constant: 24),
            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 8),
            amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            amountTextField.trailingAnchor.constraint(equalTo: currencyButton.leadingAnchor, constant: -8),
            amountTextField.heightAnchor.constraint(equalToConstant: 56),
            
            currencyButton.topAnchor.constraint(equalTo: amountTextField.topAnchor),
            currencyButton.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 8),
            currencyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            currencyButton.widthAnchor.constraint(equalToConstant: 110),
            currencyButton.heightAnchor.constraint(equalToConstant: 56),
            
            // MARK: - Note
            noteLabel.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 24),
            noteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            noteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            noteTextView.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 8),
            noteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            noteTextView.heightAnchor.constraint(equalToConstant: 140),
            
            
            // MARK: - Button
            currencyTextField.topAnchor.constraint(equalTo: currencyButton.topAnchor),
            currencyTextField.leadingAnchor.constraint(equalTo: currencyButton.leadingAnchor),
            currencyTextField.trailingAnchor.constraint(equalTo: currencyButton.trailingAnchor),
            currencyTextField.bottomAnchor.constraint(equalTo: currencyButton.bottomAnchor),
            
            createDebtButton.topAnchor.constraint(equalTo: noteTextView.bottomAnchor, constant: 28),
            createDebtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            createDebtButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            createDebtButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

extension NewDebtViewController: CustomerSelectionDelegate {
    func didSelectCustomer(customer: Customers) {
        customerTitleLabel.text = "\(customer.name) \(customer.surname)"
        customerSubtitleLabel.text = customer.phone
    }
}

extension NewDebtViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.currencies.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = viewModel.currencies[row]
        currencyButton.setTitle(selectedCurrency, for: .normal)
        currencyTextField.resignFirstResponder()
        viewModel.updateCurrency(index: row)
    }
}

extension NewDebtViewController: NewDebtViewModelDelegate {
    func didSaveDebts() {
        navigationController?.popViewController(animated: true)
        print("debts saved")
    }

    func didError(error: ErrorList) {
        print(error.description)
    }
}
