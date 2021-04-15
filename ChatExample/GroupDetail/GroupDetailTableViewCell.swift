//
//  GroupDetailTableViewCell.swift
//  ChatExample
//
//  Created by Jasmin Patel on 16/04/21.
//

import Foundation
import UIKit

class GroupDetailTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: DesignableImageView!
    @IBOutlet weak var fullAccessButton: UIButton!
    @IBOutlet weak var regularAccessButton: UIButton!
    
    //MARK: Configure Cell
    func configureCell(user: User) {
        nameLabel.text = user.displayName
        userImageView.image = user.avatar
        userImageView.borderColor = user.isAdmin ? #colorLiteral(red: 0.6901960784, green: 0.2352941176, blue: 1, alpha: 1) : #colorLiteral(red: 0.431372549, green: 0.462745098, blue: 0.5333333333, alpha: 1)
        fullAccessButton.backgroundColor = user.isAdmin ? #colorLiteral(red: 0.6901960784, green: 0.2352941176, blue: 1, alpha: 1) : #colorLiteral(red: 0.2156862745, green: 0.2509803922, blue: 0.3058823529, alpha: 1)
        regularAccessButton.backgroundColor = !user.isAdmin ? #colorLiteral(red: 0.431372549, green: 0.462745098, blue: 0.5333333333, alpha: 1) : #colorLiteral(red: 0.2156862745, green: 0.2509803922, blue: 0.3058823529, alpha: 1)
    }
    
}
