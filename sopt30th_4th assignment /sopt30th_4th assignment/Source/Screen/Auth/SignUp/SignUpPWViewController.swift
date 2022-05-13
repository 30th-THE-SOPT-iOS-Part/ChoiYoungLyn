//
//  RegisterPWViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/12.
//

import UIKit

class SignUpPWViewController: UIViewController {

    // MARK: - Properties
    var user: String?
    var password: String?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setButtonUI()
        setBackButton()
        setPwTextField()
    }
    
    // MARK: - Functions
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setPwTextField() {
        self.pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setUI(){
        pwTextField.setIcon(UIImage(named: Const.Image.Name.pwhidden))
    }
    
    private func setButtonUI(){
        nextButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        nextButton.isEnabled = false
        nextButton.layer.cornerRadius = 5
    }
    
    // MARK: - objc Function
    @objc func textFieldDidChange(sender: UITextField) {
        if pwTextField.hasText {
            self.nextButton.backgroundColor = .systemBlue
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            self.nextButton.isEnabled = false
        }
    }
    
    // MARK: - @IBAction Properties
    @IBAction func pwNextButtonDidTap(_ sender: Any) {
        let welcomeSB = UIStoryboard(name: Const.Storyboard.Name.welcome, bundle: nil)
        
        guard let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.welcomeVC) as? WelcomeViewController else { return }

        welcomeVC.user = user
        welcomeVC.password = pwTextField.text
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen

        self.present(welcomeVC, animated: true, completion: nil)
    }

}
