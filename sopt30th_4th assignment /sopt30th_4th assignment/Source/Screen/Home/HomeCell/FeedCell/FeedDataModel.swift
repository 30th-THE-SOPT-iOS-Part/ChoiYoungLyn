//
//  FeedDataModel.swift
//  sopt30th_3rd assignment
//
//  Created by μ΅μλ¦° on 2022/05/03.
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
        FeedDataModel(profileImageName: Const.Image.Name.avatar1, profileUserName: "avatar1", feedImageName: "", likeCount: 30, feedContent: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.", commentCount: 19),
        FeedDataModel(profileImageName: Const.Image.Name.avatar2, profileUserName: "avatar2", feedImageName: "", likeCount: 330, feedContent: "β° ν° λͺ©νλ₯Ό μ΄λ£¨κ³  μΆμΌλ©΄ νλ½μ κ΅¬νμ§ λ§λΌ", commentCount: 24),
        FeedDataModel(profileImageName: Const.Image.Name.avatar3, profileUserName: "avatar3", feedImageName: "", likeCount: 130, feedContent: "π± λ νλ λλ‘ νλ©΄ λ μ»λ κ²μ μ»λλ€.", commentCount: 100),
        FeedDataModel(profileImageName: Const.Image.Name.avatar4, profileUserName: "avatar4", feedImageName: "", likeCount: 240, feedContent: "111111111111111111111111111111111111111111111111111111111111111111111.", commentCount: 140)
    ]
}

