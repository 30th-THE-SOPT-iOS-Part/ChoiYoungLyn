//
//  StoryCollectionViewCell.swift
//  sopt30th_3rd assignment
//
//  Created by 최영린 on 2022/05/04.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(storyData : StoryDataModel) {
        storyImage.image = UIImage(named: storyData.storyImageName)
        userName.text = storyData.userName
    }
}
