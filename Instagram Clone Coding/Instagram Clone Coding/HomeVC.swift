//
//  RedViewController.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/16.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //???: 아래 주석 관련 코드.
//        setLeftBarButton()
        let nib=UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        feedTableView.register(nib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        let nib2=UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        storyCollectionView.register(nib2, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        feedTableView.delegate=self
        feedTableView.dataSource=self
        
        storyCollectionView.delegate=self
        storyCollectionView.dataSource=self
    }
    //???: 아래 코드를 작성해서 leftBarButtonItem을 넣어주려고도 해봤는데(버튼 크기 직접 조절해주고 싶어서) 왜 안되나요? 에러메세지는 없었습니다.
//    func setLeftBarButton(){
//        let logoButton = UIButton(type: .custom)
//        logoButton.frame = CGRect(x: 0, y: 0, width:96, height: 27)
//        logoButton.setImage(UIImage(named:"Instagram Black Logo"), for: .normal)
//
//        let navBarItem = UIBarButtonItem(customView: logoButton)
//        self.navigationItem.leftBarButtonItem = navBarItem
//    }
}

extension HomeVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 510
  }
}

extension HomeVC: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FeedDataModel.sampleData.count
      //섹션마다 몇 개의 행을 넣을 것인지
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //어떤 행을 어떻게 보여줄 것인지
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell()}
    
    cell.setData(FeedDataModel.sampleData[indexPath.row])
    
    return cell
  }
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width
    
    let cellWidth = width * (58/375)
    let cellHeight = cellWidth * (72/58)
    
    return CGSize(width: cellWidth, height: cellHeight)
  }
  
}

extension HomeVC : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return StoryDataModel.sampleData.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as?  StoryCollectionViewCell else {
      return UICollectionViewCell()
    }
      cell.setData(StoryDataModel.sampleData[indexPath.row])
    return cell
  }
}

