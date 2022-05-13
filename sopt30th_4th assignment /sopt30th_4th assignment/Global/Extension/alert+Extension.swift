//
//  alert+Extension.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/14.
//

import UIKit

extension UIViewController{
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


