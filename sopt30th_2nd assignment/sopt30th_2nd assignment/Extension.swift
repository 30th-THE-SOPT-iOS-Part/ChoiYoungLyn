//
//  Extension.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/14.
//

import UIKit

extension UITextField {
    
    func setIcon(_ image: UIImage?) {
        let iconButton = UIButton(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
        iconButton.setImage(image, for: .normal)
        iconButton.addTarget(self, action: #selector(passwordButtonDidTap), for: .touchUpInside)
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconButton)
        
        rightView = iconContainerView
        rightViewMode = .always
    }
    
    @objc func passwordButtonDidTap(_ sender: UIButton){
        isSecureTextEntry ? sender.setImage(UIImage(named: Const.Image.Name.pwshown), for: .normal) : sender.setImage(UIImage(named: Const.Image.Name.pwhidden), for: .normal)

        isSecureTextEntry.toggle()
    }
    
}


