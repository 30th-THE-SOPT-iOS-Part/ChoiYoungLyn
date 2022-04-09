//
//  RegisterPWViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class RegisterPWViewController: UIViewController {

    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton! {
        didSet{
            nextButton.isEnabled = false
        }
    }
    
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButton()
        setNextButton()
    }
    
    @IBAction func pwNextButtonDidTap(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }

        welcomeVC.user = user
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen

        self.present(welcomeVC, animated: true, completion: nil) 
    }
    
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func textHandler(_ a: UIAction) -> Void {
        if self.pwTextField.text?.isEmpty == true {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
    }
    
    private func setNextButton() {
        self.pwTextField.addAction(UIAction(handler: self.textHandler), for: .editingChanged)
    }

}
