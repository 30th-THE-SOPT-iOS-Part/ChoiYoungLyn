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
        //1. 스토리보드 상에 있는 뷰 컨트롤러 안전하게 가져와서 인스턴스화 -> 사용할 화면, 연결할 화면 가져오기
        guard let homeViewController =
                self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.homeVC),
              let searchViewController =
                self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.searchVC),
              let reelsViewController =
                self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.reelsVC),
              let shopViewController =
                self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.shopVC),
              let mypageViewController =
                self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.mypageVC)
        else { return }

        //2. 탭바 아이템 설정
        homeViewController.tabBarItem = UITabBarItem (title: "", image: UIImage(named: Const.Image.Name.home), selectedImage: UIImage(named:  Const.Image.Name.home_selected))

        searchViewController.tabBarItem = UITabBarItem (title: "", image: UIImage(named: Const.Image.Name.search), selectedImage: UIImage(named: Const.Image.Name.search_selected))
        
        reelsViewController.tabBarItem = UITabBarItem (title: "", image: UIImage(named: Const.Image.Name.reels), selectedImage: UIImage(named:  Const.Image.Name.reels_selected))
       
        shopViewController.tabBarItem = UITabBarItem (title: "", image: UIImage(named: Const.Image.Name.shop), selectedImage: UIImage(named: Const.Image.Name.shop_selected))
        
        mypageViewController.tabBarItem = UITabBarItem (title: "", image: UIImage(named: Const.Image.Name.profile)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: Const.Image.Name.profile_selected)?.withRenderingMode(.alwaysOriginal))

        setViewControllers([homeViewController, searchViewController, reelsViewController, shopViewController, mypageViewController], animated: true)
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


