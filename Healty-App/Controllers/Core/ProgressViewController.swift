//
//  ProgressViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 14.12.2021.
//

import UIKit

class ProgressViewController: UIViewController {
    
    let bazier = UIBezierPath()
    
    let progressTopView = ProgressTopView()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Daily"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(progressTopView)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressTopView.frame = CGRect(x: 10, y: view.top + view.safeAreaInsets.top + 10, width: view.width - 20, height: 340)
        tableView.frame = CGRect(x: 10, y: progressTopView.bottom + 20, width: view.width - 20, height: view.height - (370 + view.safeAreaInsets.top + view.safeAreaInsets.bottom))
        
    }
    
    
    
}


extension ProgressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "sabah"
        } else if section == 1 {
            return "öğle"
        } else {
            return "akşam"
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Yemek: \(indexPath.row)"
        cell.detailTextLabel?.text = "Last Supper"
        cell.accessoryType = .checkmark
        return cell
    }
    
    
}


