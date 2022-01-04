//
//  BMRCalculateViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 17.12.2021.
//

import UIKit

class BMRCalculateViewController: UIViewController {
    
    var bmr = 0.0
    var weight = 0.0
    var height = 0.0
    var age = 0.0
    var sex = ""
    var sexArray = ["men", "women"]
    
    
    let pickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
        pickerView.backgroundColor = .black
        return pickerView
    }()
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Please fill the blanks carefully !", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                                                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)])
        label.textAlignment = .center
        return label
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "weight (kg)..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardType = .numberPad
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "height (cm)..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardType = .numberPad
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "age..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardType = .numberPad
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let sexTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "men/women..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Next !", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        sexTextField.inputView = pickerView
        sexTextField.inputAccessoryView = toolBar
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        label.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 80, width: view.width - 40, height: 60)
        weightTextField.frame = CGRect(x: 20, y: label.bottom + 40, width: view.width - 40, height: 50)
        heightTextField.frame = CGRect(x: 20, y: weightTextField.bottom + 10, width: view.width - 40, height: 50)
        ageTextField.frame = CGRect(x: 20, y: heightTextField.bottom + 10, width: view.width - 40, height: 50)
        sexTextField.frame = CGRect(x: 20, y: ageTextField.bottom + 10, width: view.width - 40, height: 50)
        button.frame = CGRect(x: 100, y: sexTextField.bottom + 20, width: view.width - 200, height: 40)
    }
    
    func addSubviews() {
        view.addSubview(label)
        view.addSubview(weightTextField)
        view.addSubview(heightTextField)
        view.addSubview(ageTextField)
        view.addSubview(sexTextField)
        view.addSubview(button)
    }
    
    @objc func donePicker() {
        sexTextField.resignFirstResponder()
    }
    
    @objc func buttonClicked() {
        let vc = CalorieCalculateViewController()
        
        weight = Double(weightTextField.text!)!
        height = Double(heightTextField.text!)!
        age = Double(ageTextField.text!)!
        sex = sexTextField.text!
        
        if sex == "men" {
            bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5
        } else {
            bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161
        }
        
        
        
        vc.modalPresentationStyle = .fullScreen
        vc.bmr = bmr
        present(vc, animated: true)
    }
    
    
    
}

extension BMRCalculateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        sexArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let row = pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(row, inComponent: 0, animated: false)
        sexTextField.text = sexArray[row]
        
    }
    
    
    
    
}
