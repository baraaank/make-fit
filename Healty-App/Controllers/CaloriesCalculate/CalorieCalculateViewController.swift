//
//  CalorieCalculateViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 18.12.2021.
//

import UIKit

class CalorieCalculateViewController: UIViewController {

    var bmr = 0.0
    
    private let label: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Please choose activity level !", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)])
        label.textAlignment = .center
        return label
    }()
    
    
    private let sedentaryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Sedentary Active", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let lightlyActiveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Lightly Active", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let moderatelyActiveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Moderately Active", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let veryActiveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Very Active", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let extraActiveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Extra Active", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        print(bmr)
        
        sedentaryButton.addTarget(self, action: #selector(sedentaryButtonClicked), for: .touchUpInside)
        lightlyActiveButton.addTarget(self, action: #selector(lightlyActiveButtonClicked), for: .touchUpInside)
        moderatelyActiveButton.addTarget(self, action: #selector(moderatelyActiveButtonClicked), for: .touchUpInside)
        veryActiveButton.addTarget(self, action: #selector(veryActiveButtonClicked), for: .touchUpInside)
        extraActiveButton.addTarget(self, action: #selector(extraActiveButtonClicked), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        label.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 80, width: view.width - 40, height: 60)
        sedentaryButton.frame = CGRect(x: 20, y: label.bottom + 40, width: view.width - 40, height: 50)
        lightlyActiveButton.frame = CGRect(x: 20, y: sedentaryButton.bottom + 10, width: view.width - 40, height: 50)
        moderatelyActiveButton.frame = CGRect(x: 20, y: lightlyActiveButton.bottom + 10, width: view.width - 40, height: 50)
        veryActiveButton.frame = CGRect(x: 20, y: moderatelyActiveButton.bottom + 10, width: view.width - 40, height: 50)
        extraActiveButton.frame = CGRect(x: 20, y: veryActiveButton.bottom + 10, width: view.width - 40, height: 50)
    }
    

    func addSubviews() {
        view.addSubview(label)
        view.addSubview(sedentaryButton)
        view.addSubview(lightlyActiveButton)
        view.addSubview(moderatelyActiveButton)
        view.addSubview(veryActiveButton)
        view.addSubview(extraActiveButton)
    }

    
    @objc func sedentaryButtonClicked() {
        let vc = GoalViewController()
        let cal = bmr * 1.2
        vc.calorie = cal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func lightlyActiveButtonClicked() {
        let vc = GoalViewController()
        let cal = bmr * 1.375
        vc.calorie = cal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func moderatelyActiveButtonClicked() {
        let vc = GoalViewController()
        let cal = bmr * 1.55
        vc.calorie = cal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func veryActiveButtonClicked() {
        let vc = GoalViewController()
        let cal = bmr * 1.725
        vc.calorie = cal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func extraActiveButtonClicked() {
        let vc = GoalViewController()
        let cal = bmr * 1.9
        vc.calorie = cal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
