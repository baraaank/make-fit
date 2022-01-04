//
//  TabBarViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 14.12.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = UserDefaults.standard.value(forKey: "userId") as! String
        let calorie = UserDefaults.standard.value(forKey: "calorie") as! Int

        let vc1 = HomeViewController()
        let vc2 = DailyViewController()
//        vc2.id = id
        vc2.calorie = calorie
//        let vc3 = ProgressViewController()
        let vc4 = ProfileViewController()
        
        
        
//        vc1.navigationItem.largeTitleDisplayMode = .always
//        vc2.navigationItem.largeTitleDisplayMode = .always
//        vc3.navigationItem.largeTitleDisplayMode = .always
//        vc4.navigationItem.largeTitleDisplayMode = .always

        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
//        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)

        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
//        nav3.navigationBar.tintColor = .label
        nav4.navigationBar.tintColor = .label

        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Daily", image: UIImage(systemName: "heart.fill"), tag: 1)
//        nav3.tabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "hourglass"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)

//        nav1.navigationBar.prefersLargeTitles = true
//        nav2.navigationBar.prefersLargeTitles = true
//        nav3.navigationBar.prefersLargeTitles = true
//        nav4.navigationBar.prefersLargeTitles = true

        setViewControllers([nav1, nav2, /*nav3*/ nav4], animated: false)
    }
    

}
