//
//  WelcomeViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK:-Properties
    var user: String?
    
    // MARK:- @IBOutlet Properties
    @IBOutlet weak var welcomeTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
   
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMessage()
        setButtonUI()
    }

    // MARK:- Function
    private func setMessage() {
        if let user = user {
            welcomeTextView.textAlignment = .center
            welcomeTextView.text = user + "님 Instagram에 \n 오신 것을 환영합니다."
        }
    }
    
    private func setButtonUI(){
        doneButton.layer.cornerRadius = 5
    }
    
    // MARK:- @IBAction
    @IBAction func doneButtonDidTap(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        
        self.dismiss(animated: false) {
            presentingVC.popToRootViewController(animated: true)
        }
    }
}

