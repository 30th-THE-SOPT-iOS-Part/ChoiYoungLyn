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
    let feedImageName: String
    var feedImage: UIImage? {
        return UIImage(named: feedImageName)
    }
    var likeCount: Int
    let feedContent: String
    let commentCount: Int
}

extension FeedDataModel {
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(profileImageName: Const.Image.Name.avatar1, profileUserName: "avatar1", feedImageName: Const.Image.Name.postImage1, likeCount: 30, feedContent: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", commentCount: 19),
        FeedDataModel(profileImageName: Const.Image.Name.avatar2, profileUserName: "avatar2", feedImageName: Const.Image.Name.postImage2, likeCount: 330, feedContent: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", commentCount: 24),
        FeedDataModel(profileImageName: Const.Image.Name.avatar3, profileUserName: "avatar3", feedImageName: Const.Image.Name.postImage3, likeCount: 130, feedContent: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다.", commentCount: 100),
        FeedDataModel(profileImageName: Const.Image.Name.avatar4, profileUserName: "avatar4", feedImageName: Const.Image.Name.postImage4, likeCount: 240, feedContent: "✨ 행동은 모든 성공의 가장 기초적인 핵심이다.", commentCount: 140)
    ]
}

