//
//  LoginViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK:- @IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton! {
        didSet{
            loginButton.isEnabled = false
        }
    }
    @IBOutlet weak var passwordButton: UIButton!
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI()
        setBackButton()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        removeTextField()
        loginButton.isEnabled = false
    }
    
    // MARK:- Function
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setButtonUI(){
        loginButton.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        [idTextField,pwTextField].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    private func removeTextField() {
        [idTextField,pwTextField].forEach {
            $0.text?.removeAll()
        }
    }
    
    // MARK:- objc Function
    @objc func textFieldDidChange(sender: UITextField) {
        self.loginButton.isEnabled = self.idTextField.hasText && self.pwTextField.hasText
        }
    
    // MARK:- @IBAction
    @IBAction func passwordButton(_ sender: Any) {
        passwordButton.setImage(pwTextField.isSecureTextEntry ? UIImage(named: "PasswordHidden") : UIImage(named: "PasswordShown"), for: .normal)
        pwTextField.isSecureTextEntry = !pwTextField.isSecureTextEntry
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeVC.user = idTextField.text
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen

        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        guard let registerIDVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterIDViewController") as? RegisterIDViewController else { return }
        
        self.navigationController?.pushViewController(registerIDVC, animated: true)
    }
    
}


