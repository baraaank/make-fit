//
//  DailyViewCell.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 2.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "cell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let gramLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let portionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let calLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(gramLabel)
        addSubview(portionLabel)
        addSubview(calLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        nameLabel.frame = CGRect(x: 10, y: 10, width: 150, height: 30)
        gramLabel.frame = CGRect(x: 10, y: nameLabel.frame.height + 20, width: 150, height: 30)
        portionLabel.frame = CGRect(x: 150 + 10, y: 10, width: 150, height: 30)
        calLabel.frame = CGRect(x: 150 + 10, y: nameLabel.frame.height + 20, width: 150, height: 30)
    }
    
    
    
    func configureCellLayOut(with viewModel: Food) {
        nameLabel.text = viewModel.name
        gramLabel.text = String(viewModel.gr) + " gr"
        portionLabel.text = String(viewModel.portion) + " " + String(viewModel.portion_name)
        calLabel.text = String(viewModel.cal) + " cal"
    }
    
}
