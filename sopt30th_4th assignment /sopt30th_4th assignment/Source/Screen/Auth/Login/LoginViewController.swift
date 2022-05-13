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
        login()
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let signupSB = UIStoryboard(name: Const.Storyboard.Name.signup, bundle: nil)
        guard let registerIDVC = signupSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signupIDVC) as? SignUpIDViewController else { return }
        
        self.navigationController?.pushViewController(registerIDVC, animated: true)
    }
    
}

extension LoginViewController {
    
    func login() {
        guard let email = idTextField.text else { return }
        guard let password = pwTextField.text else { return }
        
        UserService.shared.login(
            email: email,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
                self.alerttransition(message: "로그인 성공", storyboard: Const.Storyboard.Name.tabBar, viewcontroller: Const.ViewController.Identifier.customtabBarVC)
                print(data)
            case .pathErr(let data):
                guard let data = data as? LoginResponse else { return }
                data.status == 404 ? self.alert(message: "해당하는 계정이 없습니다. ") : self.alert(message: "비밀번호를 다시 입력하세요.")
                print(data.message)
            default:
                self.alert(message: "로그인 실패")
            }
        }
    }
    
    func alerttransition(message: String, storyboard: String, viewcontroller: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){_ in
            let viewcontroller = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: viewcontroller)
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(viewcontroller, animated: false)
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }

    func alert(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
    



