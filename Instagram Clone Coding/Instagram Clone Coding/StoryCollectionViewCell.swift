//
//  StoryCollectionViewCell.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var storyButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ storyData: StoryDataModel){
        storyButton.setImage(storyData.profileImage, for: .normal)
        nameLabel.text=storyData.userName
        
    }
}
