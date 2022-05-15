//
//  FeedTableViewCell.swift
//  sopt30th_3rd assignment
//
//  Created by 최영린 on 2022/05/04.
//

import UIKit

protocol FeedTableViewCellDelegate : AnyObject{
    func likeButtonDidTap(_ cell: FeedTableViewCell, didTap : Bool)
}

class FeedTableViewCell: UITableViewCell {

    static let identifier = "FeedTableViewCell"
    
    weak var delegate: FeedTableViewCellDelegate?
    
    var feedModel: FeedDataModel? {
           didSet {
               guard let feedModel = feedModel else { return }
               setData(feedModel)
           }
       }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileUserName: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var feedUserName: UILabel!
    @IBOutlet weak var feedContent: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ feedData: FeedDataModel) {
        profileImage.image = feedData.profileImage
        profileUserName.text = feedData.profileUserName
        feedImage.load(imgURL: feedData.feedImageName)
        likeCount.text = "좋아요 \(feedData.likeCount)개"
        feedUserName.text = feedData.profileUserName
        feedContent.text = feedData.feedContent
        commentCount.text = "댓글 \(feedData.commentCount)개 모두 보기"
    }

    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        delegate?.likeButtonDidTap(self, didTap: !sender.isSelected)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
