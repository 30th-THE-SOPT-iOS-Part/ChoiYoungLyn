//
//  HomeViewController.swift
//  sopt30th_2nd assignment
//
//  Created by 최영린 on 2022/04/15.
//

import UIKit

class HomeViewController: UIViewController {

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
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat = indexPath.section == 0 ? 72 : 488
        return height
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count : Int = section == 0 ? 1 : FeedDataModel.sampleData.count
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0 :
            guard let storyCell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
            return storyCell
        case 1:
            guard let feedCell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
            feedCell.setData(FeedDataModel.sampleData[indexPath.row])
            feedCell.selectionStyle = .none
            return feedCell
        default:
            return UITableViewCell()
        }
    }
}
