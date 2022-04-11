//
//  RegisterIDViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class RegisterIDViewController: UIViewController {

    // MARK:- Properties
    var user: String?
    
    // MARK:- @IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton! {
        didSet{
            nextButton.isEnabled = false
        }
    }

    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI()
        setBackButton()
        setIdTextField()
    }
    
    // MARK:- Function
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setIdTextField() {
        self.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setButtonUI(){
        nextButton.layer.cornerRadius = 5
    }
    
    // MARK:- objc Function
    @objc func textFieldDidChange(sender: UITextField) {
        self.nextButton.isEnabled = self.idTextField.hasText
    }
    
    // MARK:- @IBAction
    @IBAction func idNextButtonDidTap(_ sender: Any) {
        guard let registerPWVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterPWViewController") as? RegisterPWViewController else { return }
        
        registerPWVC.user = idTextField.text
                
        self.navigationController?.pushViewController(registerPWVC, animated: true)
    }
}
