//
//  RegisterIDViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/12.
//

import UIKit

class SignUpIDViewController: UIViewController {

    // MARK: - Properties
    var user: String?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI()
        setBackButton()
        setIdTextField()
    }
    
    // MARK: - Functions
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setIdTextField() {
        self.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setButtonUI(){
        nextButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        nextButton.isEnabled = false
        nextButton.layer.cornerRadius = 5
    }
    
    // MARK: - objc Function
    @objc func textFieldDidChange(sender: UITextField) {
        if self.idTextField.hasText {
            self.nextButton.backgroundColor = .systemBlue
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            self.nextButton.isEnabled = false
        }
        
    }
    
    // MARK: - @IBAction Properties
    @IBAction func idNextButtonDidTap(_ sender: Any) {
        guard let registerPWVC = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signupPWVC) as? SignUpPWViewController else { return }
        
        registerPWVC.user = idTextField.text
                
        self.navigationController?.pushViewController(registerPWVC, animated: true)
    }
}
