//
//  SignUpViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 16.12.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "Logo")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "email..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .white
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 4
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "name..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .white
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 4
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "surname..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .white
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 4
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "password..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .white
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 4
        textField.layer.borderColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let backToLogInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back to Login Screen", for: .normal)
        return button
    }()
    
    private let termsAndConditionsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        backToLogInButton.addTarget(self, action: #selector(backToLogInButtonClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        imageView.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 10, width: view.width - 80, height: view.height / 3)
        emailTextField.frame = CGRect(x: 20, y: imageView.bottom + 20, width: view.width - 40, height: 60)
        nameTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 10, width: view.width - 40, height: 60)
        surnameTextField.frame = CGRect(x: 20, y: nameTextField.bottom + 10, width: view.width - 40, height: 60)
        passwordTextField.frame = CGRect(x: 20, y: surnameTextField.bottom + 10, width: view.width - 40, height: 60)
        signUpButton.frame = CGRect(x: 100, y: passwordTextField.bottom + 20 , width: view.width - 200, height: 40)
        backToLogInButton.frame = CGRect(x: 20, y: signUpButton.bottom + 20, width: view.width - 40, height: 20)
//        termsAndConditionsButton.frame = CGRect(x: 20, y: view.height - (view.width / 7), width: view.width - 40, height: 20)
    }
    
    func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(emailTextField)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(backToLogInButton)
//        view.addSubview(termsAndConditionsButton)
    }
    
    @objc func signUpButtonClicked() {
        APICaller.shared.createUser(email: emailTextField.text!, name: nameTextField.text!, surname: surnameTextField.text!, password: passwordTextField.text!) { response in
            if response == true {
                print("user created")
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Congrulations", message: "You Sign Up Successfully!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Go to Log In", style: .default, handler: { action in
                        switch action.style{
                            case .default:
                                
                                let vc = LogInViewController()
                                vc.modalPresentationStyle = .fullScreen
                                self.present(vc, animated: true)
                            
                            case .cancel:
                            print("cancel")
                            
                            case .destructive:
                            print("destructive")
                            
                        }
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                print("User is not created")
            }
            
        }
    }
    
    @objc func backToLogInButtonClicked() {
        let vc = LogInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }


}
