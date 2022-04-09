//
//  LoginViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton! {
        didSet{
            loginButton.isEnabled = false
        }
    }
    @IBOutlet weak var passwordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButton()
        setLoginButton()
    }
    
    @IBAction func passwordButton(_ sender: Any) {
        if(pwTextField.isSecureTextEntry){
            pwTextField.isSecureTextEntry = false
            passwordButton.setImage(UIImage(named: "PasswordHidden"), for: .normal)
            }
        else{
            pwTextField.isSecureTextEntry = true
            passwordButton.setImage(UIImage(named: "PasswordShown"), for: .normal)
        }
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
    
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func textHandler(_ a: UIAction) -> Void {
        if self.idTextField.text?.isEmpty == true || self.pwTextField.text?.isEmpty == true{
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
    }
    
    private func setLoginButton() {
        self.idTextField.addAction(UIAction(handler: self.textHandler), for: .editingChanged)
        self.pwTextField.addAction(UIAction(handler: self.textHandler), for: .editingChanged)
    }
    
}


