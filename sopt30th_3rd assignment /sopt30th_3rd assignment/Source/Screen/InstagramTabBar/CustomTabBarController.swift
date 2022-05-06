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
        //옵셔널 바인딩으로 ! 없애자
        //guard let 사용해라.
        tabBar.backgroundColor = item != (tabBar.items!)[2] ? .white : .black
        tabBar.tintColor = item != (tabBar.items!)[2] ? .black : .white
        tabBar.unselectedItemTintColor = item != (tabBar.items!)[2] ? .black : .white
    }
}


