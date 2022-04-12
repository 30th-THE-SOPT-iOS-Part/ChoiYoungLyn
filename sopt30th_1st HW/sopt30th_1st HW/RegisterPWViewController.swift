//
//  RegisterPWViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class RegisterPWViewController: UIViewController {

    // MARK:- Properties
    var user: String?
    
    // MARK:- @IBOutlet Properties
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI()
        setBackButton()
        setPwTextField()
    }
    
    // MARK:- Function
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    // MARK:- objc Function
    @objc func textFieldDidChange(sender: UITextField) {
        self.nextButton.isEnabled = self.pwTextField.hasText
    }
    
    private func setPwTextField() {
        self.pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setButtonUI(){
        nextButton.isEnabled = false
        nextButton.layer.cornerRadius = 5
    }
    
    // MARK:- @IBAction
    @IBAction func pwNextButtonDidTap(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }

        welcomeVC.user = user
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen

        self.present(welcomeVC, animated: true, completion: nil)
    }

}
