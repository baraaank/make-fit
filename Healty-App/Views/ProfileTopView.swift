//
//  ProfileTopView.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 15.12.2021.
//

import UIKit

class ProfileTopView: UIView {
    
    let streakLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        return label
    }()
    
    let currentKgLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        return label
    }()
    
    let profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .magenta
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let safeWidth = (width - 20) / 3
        streakLabel.frame = CGRect(x: 10, y: 10, width: safeWidth, height: 100)
        profilePictureImageView.frame = CGRect(x: streakLabel.right, y: 10, width: safeWidth, height: 100)
        progressLabel.frame = CGRect(x: profilePictureImageView.right, y: 10, width: safeWidth, height: 100)
        nameLabel.frame = CGRect(x: (width - 200)/2, y: currentKgLabel.bottom, width: 200, height: 60)
        currentKgLabel.frame = CGRect(x: (width - 200)/2, y: nameLabel.bottom, width: 200, height: 60)
    }
    
    func addSubviews() {
        addSubview(streakLabel)
        addSubview(progressLabel)
        addSubview(nameLabel)
        addSubview(currentKgLabel)
        addSubview(profilePictureImageView)
    }
    
}
