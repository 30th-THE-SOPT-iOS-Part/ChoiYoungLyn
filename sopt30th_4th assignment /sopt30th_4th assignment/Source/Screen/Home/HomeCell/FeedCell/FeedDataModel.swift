//
//  FeedDataModel.swift
//  sopt30th_3rd assignment
//
//  Created by 최영린 on 2022/05/03.
//

import UIKit

struct FeedDataModel {
    let profileImageName: String
    var profileImage: UIImage? {
        return UIImage(named: profileImageName)
    }
    let profileUserName: String
    var feedImageName: String
    var feedImage: UIImage? {
        return UIImage(named: feedImageName)
    }
    var likeCount: Int
    let feedContent: String
    let commentCount: Int
}

extension FeedDataModel {
    static var sampleData: [FeedDataModel] = [
        FeedDataModel(profileImageName: Const.Image.Name.avatar1, profileUserName: "avatar1", feedImageName: "", likeCount: 30, feedContent: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", commentCount: 19),
        FeedDataModel(profileImageName: Const.Image.Name.avatar2, profileUserName: "avatar2", feedImageName: "", likeCount: 330, feedContent: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", commentCount: 24),
        FeedDataModel(profileImageName: Const.Image.Name.avatar3, profileUserName: "avatar3", feedImageName: "", likeCount: 130, feedContent: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다.", commentCount: 100),
        FeedDataModel(profileImageName: Const.Image.Name.avatar4, profileUserName: "avatar4", feedImageName: "", likeCount: 240, feedContent: "111111111111111111111111111111111111111111111111111111111111111111111.", commentCount: 140)
    ]
}

