//
//  CustomTabBarController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/14.
//

import UIKit

class CustomTabBarController: UITabBarController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarController()
    }
    
    // MARK: - Functions
    func setTabBarController(){
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .black
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        guard let tabBarItem = tabBar.items else { return }
        tabBar.barTintColor = item != (tabBarItem)[2] ? .white : .black
        tabBar.tintColor = item != (tabBarItem)[2] ? .black : .white
        tabBar.unselectedItemTintColor = item != (tabBarItem)[2] ? .black : .white
    }
}


