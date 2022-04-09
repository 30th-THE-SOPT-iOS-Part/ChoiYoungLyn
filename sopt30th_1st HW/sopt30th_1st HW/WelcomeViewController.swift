//
//  WelcomeViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UITextView!
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMessage()
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        
        self.dismiss(animated: false) {
            presentingVC.popToRootViewController(animated: true)
        }
        
        
    }
    
    private func setMessage() {
        if let user = user {
            welcomeLabel.textAlignment = .center
            welcomeLabel.text = user + "님 Instagram에 \n 오신 것을 환영합니다."
        }
    }
}
