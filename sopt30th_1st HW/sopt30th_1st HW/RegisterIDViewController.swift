//
//  RegisterIDViewController.swift
//  sopt30th_1st HW
//
//  Created by 최영린 on 2022/04/06.
//

import UIKit

class RegisterIDViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
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
    

    @IBAction func idNextButtonDidTap(_ sender: Any) {
        guard let registerPWVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterPWViewController") as? RegisterPWViewController else { return }
        
        registerPWVC.user = idTextField.text
                
        self.navigationController?.pushViewController(registerPWVC, animated: true)
    }
    
    private func setBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func textHandler(_ a: UIAction) -> Void {
        if self.idTextField.text?.isEmpty == true {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
    }
    
    private func setNextButton() {
        self.idTextField.addAction(UIAction(handler: self.textHandler), for: .editingChanged)
    }
}
