//
//  StoryDataModel.swift
//  sopt30th_3rd assignment
//
//  Created by 최영린 on 2022/05/03.
//

import UIKit

struct StoryDataModel {
    let storyImageName: String
    var storyImage: UIImage? {
        return UIImage(named: storyImageName)
    }
    let userName : String
}

extension StoryDataModel {
    static let sampleData: [StoryDataModel] = [
        StoryDataModel(storyImageName: Const.Image.Name.avatar1, userName: "avatar1"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar2, userName: "avatar2"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar3, userName: "avatar3"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar4, userName: "avatar4"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar5, userName: "avatar5"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar6, userName: "avatar6"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar2, userName: "avatar2"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar3, userName: "avatar3"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar4, userName: "avatar4"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar5, userName: "avatar5"),
        StoryDataModel(storyImageName: Const.Image.Name.avatar6, userName: "avatar6")
    ]
}
    
