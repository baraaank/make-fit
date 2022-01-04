//
//  GoalViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 18.12.2021.
//

import UIKit

class GoalViewController: UIViewController {
    
    var calorie = 0.0

    private let label: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Please choose goal !", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)])
        label.textAlignment = .center
        return label
    }()
    
    
    private let loseWeightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("Lose Weight", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let maintainWeightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("Maintain Weight", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let gainWeightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("Gain Weight", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        print(calorie)
        loseWeightButton.addTarget(self, action: #selector(loseWeightButtonClicked), for: .touchUpInside)
        maintainWeightButton.addTarget(self, action: #selector(maintainWeightButtonClicked), for: .touchUpInside)
        gainWeightButton.addTarget(self, action: #selector(gainWeightButtonClicked), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        label.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 80, width: view.width - 40, height: 60)
        loseWeightButton.frame = CGRect(x: 20, y: label.bottom + 40, width: view.width - 40, height: 50)
        maintainWeightButton.frame = CGRect(x: 20, y: loseWeightButton.bottom + 10, width: view.width - 40, height: 50)
        gainWeightButton.frame = CGRect(x: 20, y: maintainWeightButton.bottom + 10, width: view.width - 40, height: 50)
    }
    
    func addSubviews() {
        view.addSubview(label)
        view.addSubview(loseWeightButton)
        view.addSubview(maintainWeightButton)
        view.addSubview(gainWeightButton)
        
    }
    
    @objc func loseWeightButtonClicked() {
        let vc = FinalCalorieViewController()
        let finalCalorie = calorie * 0.8
        vc.finalCalorie = finalCalorie
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func maintainWeightButtonClicked() {
        let vc = FinalCalorieViewController()
        let finalCalorie = calorie
        vc.finalCalorie = finalCalorie
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func gainWeightButtonClicked() {
        let vc = FinalCalorieViewController()
        let finalCalorie = calorie * 1.2
        vc.finalCalorie = finalCalorie
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
   

}
