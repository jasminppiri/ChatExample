//
//  ChatListFavouriteCollectionViewCell.swift
//  ChatExample
//
//  Created by Jasmin Patel on 16/04/21.
//

import Foundation
import UIKit

class ChatListFavouriteCollectionViewCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: DesignableImageView!
    
    //MARK: Configure Cell
    func configureCell(data: ChatList) {
        nameLabel.text = data.isGroup ? data.groupName : data.users.first?.displayName
        userImageView.image = data.users.first?.avatar
    }
    
}
