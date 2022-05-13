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
    var password: String?
    
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
        signup()
    }
    
    @IBAction func signInButtonDidTap(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        
        self.dismiss(animated: false) {
            presentingVC.popToRootViewController(animated: true)
        }
    }
}

extension WelcomeViewController {

    func signup() {
        guard let email = user else { return }
        guard let password = password else { return }
        
        UserService.shared.signUp(
            name: email,
            email: email,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                print(data)
                self.alerttransition(message: "회원가입 성공", storyboard: Const.Storyboard.Name.login, viewcontroller: Const.ViewController.Identifier.loginVC)
            case .pathErr(let data):
                guard let data = data as? SignUpResponse else { return }
                data.status == 409 ? self.alert(message: "이미 존재하는 계정입니다.") :
                print(data.message)
            default:
                self.alert(message: "회원가입 실패")
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
    
