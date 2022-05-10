//
//  HomeViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/15.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    private enum SectionLayout: CaseIterable {
        case story, feed
    }
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()
        setTableView()
    }

    private func setNavigationUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Const.Image.Name.logo_instagram_small), style: .plain, target: self, action: nil)
        let add = navigationItem.setRightButtonUI(self, imageName: UIImage(named: Const.Image.Name.add))
        let unlike = navigationItem.setRightButtonUI(self, imageName: UIImage(named: Const.Image.Name.unlike))
        let share = navigationItem.setRightButtonUI(self, imageName: UIImage(named: Const.Image.Name.share))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16

        navigationItem.rightBarButtonItems = [share, spacer, unlike, spacer, add]
    }
    
    private func setTableView() {
        let storyNib = UINib(nibName: StoryTableViewCell.identifier, bundle: nil)
        homeTableView.register(storyNib, forCellReuseIdentifier: StoryTableViewCell.identifier)
        
        let feedNib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        homeTableView.register(feedNib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        homeTableView.estimatedRowHeight = 500
        homeTableView.rowHeight = UITableView.automaticDimension
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate{
    // 기기별로 계산해서 높이 조절하게 바꾸기
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let height : CGFloat = indexPath.section == 0 ? 82 : UITableView.automaticDimension
//
//        return height
//    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionLayout.allCases[section]
        let count : Int = sectionType == .story ? 1 : FeedDataModel.sampleData.count
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = SectionLayout.allCases[indexPath.section]
        switch sectionType{
        case .story:
            guard let storyCell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
            return storyCell
        case .feed:
            guard let feedCell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
            feedCell.selectionStyle = .none
            feedCell.delegate = self
            feedCell.feedModel = FeedDataModel.sampleData[indexPath.row]
            return feedCell
        }
    }
}

extension HomeViewController: FeedTableViewCellDelegate {
    func likeButtonDidTap(_ feedCell: FeedTableViewCell, didTap: Bool) {
        feedCell.likeButton.isSelected.toggle()
        if didTap {
            feedCell.feedModel?.likeCount += 1
        } else {
            feedCell.feedModel?.likeCount -= 1
        }
    }
}

