//
//  HomeViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/15.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()

    }

    private func setNavigationUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Const.Image.Name.logo_instagram_small), style: .plain, target: self, action: nil)
        let add = navigationItem.setRightButtonUI(self, imageName: UIImage(named: Const.Image.Name.add))
        let unlike = navigationItem.setRightButtonUI(self, imageName: UIImage(named: Const.Image.Name.unlike))
        let share = navigationItem.setRightButtonUI(self, imageName: UIImage(named: Const.Image.Name.share))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16

        navigationItem.rightBarButtonItems = [share, spacer, unlike, spacer, add]
    }
    
    
}
