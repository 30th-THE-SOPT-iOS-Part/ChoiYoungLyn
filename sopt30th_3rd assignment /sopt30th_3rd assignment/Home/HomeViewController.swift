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
        let storyNib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        homeTableView.register(storyNib, forCellReuseIdentifier: StoryCollectionViewCell.identifier)
        
        let feedNib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        homeTableView.register(feedNib, forCellReuseIdentifier: StoryCollectionViewCell.identifier)
        
//        homeTableView.delegate = self
//        homeTableView.dataSource = self
    }
}

//extension HomeViewController: UITableViewDelegate{
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return 90
////    }
//}
//
//extension HomeViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return FeedDataModel.sampleData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else { return UITableViewCell() }
//
//        cell.setData(StoryDataModel.sampleData[indexPath.row])
//
//        return cell
//    }
//}
