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
        if item != (tabBar.items!)[2] {
            tabBar.backgroundColor = .white
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
        else{
            tabBar.backgroundColor = .black
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        }
    }

}


