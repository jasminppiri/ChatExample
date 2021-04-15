//
//  ChatGroupListCollectionViewCell.swift
//  ChatExample
//
//  Created by Jasmin Patel on 10/04/21.
//

import UIKit

class ChatGroupListCollectionViewCell: UICollectionViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var userImageView: DesignableImageView!
    
    //MARK: Configure Cell
    func configureCell(user: User) {
        userImageView.image = user.avatar
        userImageView.borderColor = user.isAdmin ? #colorLiteral(red: 0.6901960784, green: 0.2352941176, blue: 1, alpha: 1) : #colorLiteral(red: 0.431372549, green: 0.462745098, blue: 0.5333333333, alpha: 1)
    }

}
