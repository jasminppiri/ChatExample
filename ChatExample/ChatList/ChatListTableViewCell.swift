//
//  ChatListTableViewCell.swift
//  ChatExample
//
//  Created by Jasmin Patel on 16/04/21.
//

import Foundation
import UIKit

class ChatListTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberOfUserLabel: DesignableLabel?
    @IBOutlet weak var userImageView: DesignableImageView!
    
    //MARK: Configure Cell
    func configureCell(data: ChatList) {
        nameLabel.text = data.isGroup ? data.groupName : data.users.first?.displayName
        userImageView.image = data.users.first?.avatar
        if let message = data.messages.last?.last {
            if case let MSGMessageBody.text(body) = message.body {
                lastMessageLabel.text = body
            } else if case let MSGMessageBody.emoji(body) = message.body {
                lastMessageLabel.text = body
            } else {
                lastMessageLabel.text = "Image"
            }
            timeLabel.text = message.sentAt.timeAgoDisplay(.short)
        }
        numberOfUserLabel?.text = "+\(data.users.count - 1)"
    }
    
}
