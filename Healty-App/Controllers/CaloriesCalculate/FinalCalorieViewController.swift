//
//  FinalCalorieViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 18.12.2021.
//

import UIKit

class FinalCalorieViewController: UIViewController {

    var finalCalorie = 0.0
    
    private let label: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "You're done !", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)])
        label.textAlignment = .center
        return label
    }()
    
    private let letsStartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Let's Start !", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        letsStartButton.addTarget(self, action: #selector(letsStartButtonClicked), for: .touchUpInside)
        print(finalCalorie)
        
    }
    
    override func viewDidLayoutSubviews() {
        label.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 80, width: view.width - 40, height: 60)
        letsStartButton.frame = CGRect(x: 20, y: label.bottom + 40, width: view.width - 40, height: 50)
    }
    
    func addSubviews() {
        view.addSubview(label)
        view.addSubview(letsStartButton)
        
    }


    @objc func letsStartButtonClicked() {
        
        let userId = UserDefaults.standard.value(forKey: "userId") as! String
        let token = UserDefaults.standard.value(forKey: "token") as! String
        let finalCalorieInt = Int(finalCalorie)
        
        print(token)
        print(userId)
    
        print(finalCalorieInt)
        
        APICaller.shared.calculateCalorie(_id: userId, calorie: finalCalorieInt, token: token) { response in
            if response == true {
                print("in responsee")
                UserDefaults.standard.setValue(finalCalorieInt, forKey: "calorie")
                
                DispatchQueue.main.async {
                    let vc = TabBarViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            } else {
                print("fuccccckkkkkkk")
            }
            
        }
        
        
    }

}
