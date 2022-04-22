//
//  LoginViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/12.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setButtonUI()
        setBackButton()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
        setButtonUI()
    }
    
    // MARK: - Functions
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setUI(){
        pwTextField.setIcon(UIImage(named: Const.Image.Name.pwhidden))
    }
    
    private func setButtonUI(){
        loginButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        loginButton.isEnabled = false
        loginButton.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        [idTextField,pwTextField].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    private func resetTextField() {
        pwTextField.isSecureTextEntry = true
        [idTextField,pwTextField].forEach {
            $0.text?.removeAll()
        }
    }
    
    // MARK: - objc Function
    @objc func textFieldDidChange(sender: UITextField) {
        if (idTextField.hasText && pwTextField.hasText) {
            self.loginButton.backgroundColor = .systemBlue
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            self.loginButton.isEnabled = false
        }
    }
    
    // MARK: - @IBAction Properties
    @IBAction func loginButtonDidTap(_ sender: Any) {
        let welcomeSB = UIStoryboard(name: Const.Storyboard.Name.welcome, bundle: nil)
        guard let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.welcomeVC) as? WelcomeViewController else { return }
        
        welcomeVC.user = idTextField.text
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen

        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let signupSB = UIStoryboard(name: Const.Storyboard.Name.signup, bundle: nil)
        guard let registerIDVC = signupSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signupIDVC) as? SignUpIDViewController else { return }
        
        self.navigationController?.pushViewController(registerIDVC, animated: true)
    }
    
}


