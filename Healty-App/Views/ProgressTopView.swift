//
//  ProgressTopView.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 14.12.2021.
//

import UIKit

class ProgressTopView: UIView {
    
    let startKgLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    let currentKgLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .brown
        return label
    }()
    
    let changeKgLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        return label
    }()
    
    let currentLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        return label
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .magenta
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(startKgLabel)
        addSubview(currentKgLabel)
        addSubview(changeKgLabel)
        addSubview(startLabel)
        addSubview(currentLabel)
        addSubview(changeLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let viewSafeWith: CGFloat = 20.0
        let firstWidth = (width - viewSafeWith)/3
        startKgLabel.frame = CGRect(x: 10, y: 10, width: firstWidth, height: 30)
        currentKgLabel.frame = CGRect(x: startKgLabel.right, y: startKgLabel.top, width: firstWidth, height: 30)
        changeKgLabel.frame = CGRect(x: currentKgLabel.right, y: startKgLabel.top, width: firstWidth, height: 30)
        startLabel.frame = CGRect(x: 10, y: startKgLabel.bottom, width: firstWidth, height: 30)
        currentLabel.frame = CGRect(x: currentKgLabel.left, y: startLabel.top, width: firstWidth, height: 30)
        changeLabel.frame = CGRect(x: changeKgLabel.left, y: startLabel.top, width: firstWidth, height: 30)
    }
    
}
