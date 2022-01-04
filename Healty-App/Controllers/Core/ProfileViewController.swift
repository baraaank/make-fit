//
//  ProfileViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 14.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    let profileTopView = ProfileTopView()
   
    
    private let calorieLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Calorie: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .heavy)])
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Name: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .heavy)])
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Surname: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .heavy)])
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Email: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .heavy)])
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let logOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Log Out", for: .normal)
        return button
    }()
    
    private let calculateAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Calculate calorie again", for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
//        view.addSubview(profileTopView)
        addSubviews()
        logOutButton.center = view.center
        
        logOutButton.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
        calculateAgainButton.addTarget(self, action: #selector(calculateAgainButtonClicked), for: .touchUpInside)
        
        let token = UserDefaults.standard.value(forKey: "token") as! String
        let id = UserDefaults.standard.value(forKey: "userId") as! String
        APICaller.shared.getUserProfile(token: token, _id: id) { response in
            
            DispatchQueue.main.async {
                response.map({
                    self.emailLabel.text = "Mail: " + $0.email
                    self.nameLabel.text = "Name: " + $0.name
                    self.surnameLabel.text = "Surname: " + $0.surName
                    self.calorieLabel.text = "Calorie: " + String($0.calorie)
                })
            }
        }
        

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        profileTopView.frame = CGRect(x: 10, y: view.top + view.safeAreaInsets.top + 10, width: view.width - 20, height: 280)
        
        calorieLabel.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 50, width: view.width - 40, height: 50)
        nameLabel.frame = CGRect(x: 20, y: calorieLabel.bottom + 10, width: view.width - 40, height: 50)
        surnameLabel.frame = CGRect(x: 20, y: nameLabel.bottom + 10, width: view.width - 40, height: 50)
        emailLabel.frame = CGRect(x: 20, y: surnameLabel.bottom + 10, width: view.width - 40, height: 50)
        calculateAgainButton.frame = CGRect(x: 50, y: emailLabel.bottom + 10, width: view.width - 100, height: 50)
        logOutButton.frame = CGRect(x: 50, y: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom, width: view.width - 100, height: 50)
        
        

        
    }
    
    func addSubviews() {
        view.addSubview(calorieLabel)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(emailLabel)
        view.addSubview(calculateAgainButton)
        view.addSubview(logOutButton)
    }
    
    @objc func calculateAgainButtonClicked() {
        let vc = BMRCalculateViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    @objc func logOutButtonClicked() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "calorieLabel")
        UserDefaults.standard.removeObject(forKey: "doneCalorie")
        UserDefaults.standard.removeObject(forKey: "doneString")
        UserDefaults.standard.removeObject(forKey: "nameKahvaltilik")
       
        DispatchQueue.main.async {
            let vc = LogInViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

}

