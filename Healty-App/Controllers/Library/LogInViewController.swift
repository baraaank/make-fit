//
//  LogInViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 16.12.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    var token = ""
    var id = ""
    var calorie = 1
    
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "Logo")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "username..", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
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
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let doNotHaveAnAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't you have an account?"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
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
        
        logInButton.addTarget(self, action: #selector(logInButtonClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 10, width: view.width - 80, height: view.height / 3)
        usernameTextField.frame = CGRect(x: 20, y: imageView.bottom + 20, width: view.width - 40, height: 60)
        passwordTextField.frame = CGRect(x: 20, y: usernameTextField.bottom + 10, width: view.width - 40, height: 60)
        forgotPasswordButton.frame = CGRect(x: view.width / 2, y: passwordTextField.bottom + 10, width: (view.width / 2) - 20, height: 20)
        logInButton.frame = CGRect(x: 100, y: forgotPasswordButton.bottom + 20 , width: view.width - 200, height: 40)
        doNotHaveAnAccountLabel.frame = CGRect(x: 20, y: logInButton.bottom + 40, width: view.width - 40, height: 20)
        signUpButton.frame = CGRect(x: 100, y: doNotHaveAnAccountLabel.bottom + 10, width: view.width - 200, height: 40)
        termsAndConditionsButton.frame = CGRect(x: 20, y: view.height - (view.width / 7), width: view.width - 40, height: 20)
        
    }
    
    func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(logInButton)
        view.addSubview(doNotHaveAnAccountLabel)
        view.addSubview(signUpButton)
        view.addSubview(termsAndConditionsButton)
    }
    
    @objc func logInButtonClicked() {
        print("deneme")
        APICaller.shared.logInUser(email: usernameTextField.text!, password: passwordTextField.text!) { response in
            
            switch response {
            case .success(let model):
                self.token = model.token
                self.id = model.user._id
                UserDefaults.standard.setValue(self.token, forKey: "token")
                UserDefaults.standard.setValue(self.id, forKey: "userId")
                guard model.user.calorie != nil else {
                    DispatchQueue.main.async {
                        let vc = BMRCalculateViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    return
                }
                self.calorie = model.user.calorie!
                
                UserDefaults.standard.setValue(self.calorie, forKeyPath: "calorie")
                
                DispatchQueue.main.async {
                    let vc = TabBarViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func signUpButtonClicked() {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

