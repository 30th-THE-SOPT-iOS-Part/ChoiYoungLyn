//
//  UiImage+Extension.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/15.
//

import UIKit
import Kingfisher

import UIKit
import Kingfisher

extension UIImageView {
    func load(_ imageURL: String?) {
        self.kf.indicatorType = .activity
        guard let URL = URL(string: imageURL!) else { return }
        self.kf.setImage(with: URL, options: [.transition(.fade(1))]) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("DEBUG: setting Image failed: \(error.localizedDescription)")
            }
        }
    }
}
