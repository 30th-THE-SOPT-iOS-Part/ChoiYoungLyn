//
//  UiImage+Extension.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/15.
//

import UIKit

extension UIImageView {
    func load(imgURL: String) {
        let url = URL(string: imgURL)
        if url != nil {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async { self?.image = image }
                    }
                }
            }
        }
    }
}

