//
//  WelcomeViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/12.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    var user: String?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var welcomeTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
   
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMessage()
        setButtonUI()
    }

    // MARK: - Functions
    private func setMessage() {
        if let user = user {
            welcomeTextView.textAlignment = .center
            welcomeTextView.text = "\(user)님 Instagram에 \n 오신 것을 환영합니다."
        }
    }
    
    private func setButtonUI(){
        doneButton.layer.cornerRadius = 5
    }
    
    // MARK: - @IBAction Properties
    @IBAction func doneButtonDidTap(_ sender: Any) {
//        탭바로 이동
        let TabBarSB = UIStoryboard(name: Const.Storyboard.Name.tabBar, bundle: nil)
        guard let CustomTabBarVC = TabBarSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.customtabBarVC) as? CustomTabBarController else { return }

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(CustomTabBarVC, animated: false)
    }
    
    @IBAction func signInButtonDidTap(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        
        self.dismiss(animated: false) {
            presentingVC.popToRootViewController(animated: true)
        }
    }
}

